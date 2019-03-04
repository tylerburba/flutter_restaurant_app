import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:restaurant_app/model/physcial_table.dart';
import 'package:restaurant_app/model/floor_plan.dart';
import 'package:restaurant_app/model/restaurant_object.dart';
import 'package:restaurant_app/model/server_object.dart';
import 'package:restaurant_app/model/visit_log.dart';
import 'package:restaurant_app/model/shift.dart';

import 'package:restaurant_app/forms/guests_entry.dart';
import 'package:restaurant_app/forms/shift_summary.dart';
import 'package:restaurant_app/forms/server_name.dart';
import 'package:restaurant_app/forms/table_entry.dart';
import 'package:restaurant_app/forms/edit_guests_entry.dart';
import 'package:restaurant_app/forms/assign_server_name.dart';

import 'package:restaurant_app/delegates/floor_plan_delegate.dart';

import 'package:restaurant_app/widgets/server_tile.dart';

enum DialogOptions { editGuestCount, manualAssign, clear, move, reassignLastVisit }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.restaurant}) : super(key: key);

  final String title;
  final RestaurantObject restaurant;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<FloorPlan> floorPlans;
  int floorPlanIndex = 0;
  int floorPlanMaxIndex = 0;

  int nextServerIndex = 0;

  Shift shift;
  File logFile;

  final refreshRate = const Duration(seconds:30);
  Timer timer;

  @override
  void initState() {
    super.initState();
    floorPlans = widget.restaurant.floorPlans;
    floorPlanMaxIndex = widget.restaurant.floorPlanMaxIndex;
    shift = new Shift(day: DateTime.now(),
        //shiftServers: new List.from(widget.restaurant.servers.getRange(0, 2))
    );
    if(shift.shiftServers != null) shift.newSegment(DateTime.now());
  }

  List<Widget> _getFloorPlanWidgets() {
    List<Widget> widgets = new List(floorPlans[floorPlanIndex].tables.length);

    for(int i = 0 ; i < floorPlans[floorPlanIndex].tables.length ; i++) {
      widgets[i] =
      new LayoutId(
          id: floorPlans[floorPlanIndex].tables[i].id,
          child: getTableWidget(i)
      );
    }
    return widgets;
  }

  _initLog() async {
    String filePath = "/storage/emulated/0/Documents/DebugLog-"+ DateTime.now().toIso8601String().substring(0,19) +".txt";

    String debugLog = "Report generated: " + DateTime.now().toIso8601String().substring(0,19) + "\n";

    logFile = new File(filePath);
    logFile.writeAsStringSync(debugLog);
    print(filePath);
  }

  _logEntry(String logEntry) async {
    if(logFile == null) {
      _initLog();
    }
    logFile.writeAsStringSync(DateTime.now().toIso8601String() + ' ' + logEntry + '\n');
  }

  String _tableGetLabel(String server, String tableNumber) {
    if(server != '') {
      return server;
    } else {
      return tableNumber;
    }
  }

  BoxShape _tableGetShape(String shape) {
    if(shape == "square"){
      return BoxShape.rectangle;
    } else {
      return BoxShape.circle;
    }
  }

  Color _tableGetColor(String server) {
    if(server != '') {
      return Colors.green;
    } else {
      return Colors.blueGrey;
    }
  }

  Color _serverGetColor(bool isNext) {
    if(isNext) {
      return Colors.blue[100];
    } else {
      return Colors.white;
    }

  }

  _tableAssign(int index) async {
    if(floorPlans[floorPlanIndex].tables[index].server == '') {
      int newGuests = await Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new GuestEntry())
      );
      if(newGuests > 0) {
        setState(() {
          shift.assignTable(floorPlans[floorPlanIndex].tables[index].name, newGuests, nextServerIndex);
          floorPlans[floorPlanIndex].tables[index].server =
              shift.segment[shift.segment.length-1].visits[shift.segment[shift.segment.length-1].visits.length-1].visitServer;
        });
        _logEntry(' tableAssign ' + floorPlans[floorPlanIndex].tables[index].name + ' ' +
          floorPlans[floorPlanIndex].tables[index].server);
      } //if newGuest > 0
      _logEntry(' tableAssign zero guestCount');
    } else {
      setState(() {
        shift.unassignTable(floorPlans[floorPlanIndex].tables[index].name);
        floorPlans[floorPlanIndex].tables[index].server = '';
      });
      _logEntry(' tableAssign-unassign' + floorPlans[floorPlanIndex].tables[index].name + ' ' +
          floorPlans[floorPlanIndex].tables[index].server);
    }
    _refreshFunction();
  }

  _clearTable(int index) {
    if(floorPlans[floorPlanIndex].tables[index].server != '') {
      bool foundTable = false;
      print('clearTable ' + floorPlans[floorPlanIndex].tables[index].name);
      int iStart = (shift.segment.length);
      int gStart = (shift.segment[iStart - 1].visits.length);
      print('$iStart/$gStart');
      for (int i = (shift.segment.length - 1); i >= 0; i--) {
        for (int g = (shift.segment[i].visits.length - 1); g >= 0; g--) {
          if (shift.segment[i].visits[g].visitTable ==
              floorPlans[floorPlanIndex].tables[index].name &&
              foundTable == false) {
            foundTable = true;
            shift.segment[i].visits[g].visitEnd = DateTime.now();
            print('$i,$g');
            for (int c = 0 ; c < shift.shiftServers.length ; c++) {
              if(shift.shiftServers[c].name == floorPlans[floorPlanIndex].tables[index].server) {
                shift.shiftServers[c].guestThisShift -= shift.segment[i].visits[g].visitGuestCount;
                if(i == shift.segment.length-1) {
                  shift.shiftServers[c].guestThisSegment -= shift.segment[i].visits[g].visitGuestCount;
                  _logEntry(' clearTable currentSegment ' + shift.shiftServers[c].name
                      + ' guestThisShift' + shift.shiftServers[c].guestThisShift.toString()
                      + ' visitGuestCount' + shift.segment[i].visits[g].visitGuestCount.toString());
                } else {
                  shift.shiftServers[c].guestHoldover += shift.segment[i].visits[g].visitGuestCount;
                  _logEntry(' clearTable pastSegment ' + shift.shiftServers[c].name
                      + ' guestThisShift' + shift.shiftServers[c].guestHoldover.toString()
                      + ' visitGuestCount' + shift.segment[i].visits[g].visitGuestCount.toString());
                }
                setState(() {
                  floorPlans[floorPlanIndex].tables[index].server = '';
                });
                break;
              }
            }
            break;
          }
        }
        if (foundTable == true) break;
      }
    } else {
      print('clear empty table');
      _logEntry(DateTime.now().toIso8601String() + ' clearTable - empty table ');
    }
  }
  
  _editGuestCount(int index) async {
    int newGuests = await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new EditGuestEntry())
    );
    if(floorPlans[floorPlanIndex].tables[index].server != '') {
      bool foundTable = false;
      print('editTable ' + floorPlans[floorPlanIndex].tables[index].name);
      int iStart = (shift.segment.length);
      int gStart = (shift.segment[iStart - 1].visits.length);
      print('$iStart/$gStart');
      for (int i = (shift.segment.length - 1); i >= 0; i--) {
        for (int g = (shift.segment[i].visits.length - 1); g >= 0; g--) {
          if (shift.segment[i].visits[g].visitTable ==
              floorPlans[floorPlanIndex].tables[index].name &&
              foundTable == false) {
            int deltaGuest = newGuests-shift.segment[i].visits[g].visitGuestCount;
            print('deltaGuest = $deltaGuest');
            _logEntry(' editGuestCount foundTable ' + floorPlans[floorPlanIndex].tables[index].name
                + ' deltaGuest $deltaGuest');
            foundTable = true;
            print('$i,$g');
            for (int c = 0 ; c < shift.shiftServers.length ; c++) {
              if(shift.shiftServers[c].name == floorPlans[floorPlanIndex].tables[index].server) {

                print('edit ' + shift.shiftServers[c].name + shift.shiftServers[c].guestHoldover.toString());
                shift.shiftServers[c].guestThisShift += deltaGuest;
                if(shift.shiftServers[c].guestHoldover > deltaGuest) {
                  shift.shiftServers[c].guestHoldover -= deltaGuest;
                  print('holdover:' + shift.shiftServers[c].guestHoldover.toString());
                  _logEntry(' editGuestCount guestHoldover ' + shift.shiftServers[c].name + ' ' + shift.shiftServers[c].guestHoldover.toString());
                } else {
                  shift.shiftServers[c].guestThisSegment += (deltaGuest - shift.shiftServers[c].guestHoldover);
                  _logEntry(' editGuestCount guestThisSegment ' + shift.shiftServers[c].name + ' ' + shift.shiftServers[c].guestHoldover.toString());
                  shift.shiftServers[c].guestHoldover = 0;
                  print('GtS:' + shift.shiftServers[c].guestThisSegment.toString());
                  _logEntry(' editGuestCount guestThisSegment ' + shift.shiftServers[c].name + ' ' + shift.shiftServers[c].guestThisSegment.toString());
                }
                print('f edit ' + shift.shiftServers[c].name + shift.shiftServers[c].guestHoldover.toString());
                setState(() {
                  shift.segment[i].visits[g].visitGuestCount = newGuests;
                });

                break;
              }
            }
            break;
          }
        }
        if (foundTable == true) break;
      }
    } else {
      print('edit empty table');
      _logEntry('editGuestCount Empty Table');
    }
  }

  _moveTable(int index) async {
    String tableName = await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new TableEntry())
    );

    int tempFloorPlanIndex, tempTableIndex;
    bool validTable = false;
    for(int i = 0 ; i < floorPlans.length ; i++) {
      for(int g = 0 ; g < floorPlans[i].tables.length ; g++) {
        if(floorPlans[i].tables[g].name == tableName) {
          validTable = true;
          tempFloorPlanIndex = i;
          tempTableIndex = g;
          print('validTable: $validTable - $tempFloorPlanIndex,$tempTableIndex' );
          _logEntry('moveTable validTable: $validTable - $tempFloorPlanIndex,$tempTableIndex');
        }
      }
    }

    if(floorPlans[floorPlanIndex].tables[index].server != '' && validTable == true) {
      bool foundTable = false;
      print('moveTable ' + floorPlans[floorPlanIndex].tables[index].name);
      for (int i = (shift.segment.length - 1); i >= 0; i--) {
        for (int g = (shift.segment[i].visits.length - 1); g >= 0; g--) {
          print('$i/$g:' + shift.segment[i].visits[g].visitTable + ' ' + floorPlans[floorPlanIndex].tables[index].name);
          if (shift.segment[i].visits[g].visitTable == floorPlans[floorPlanIndex].tables[index].name
              && foundTable == false) {
            setState(() {
              floorPlans[floorPlanIndex].tables[index].server = '';
              floorPlans[tempFloorPlanIndex].tables[tempTableIndex].server = shift.segment[i].visits[g].visitServer;
              shift.segment[i].visits[g].visitTable = tableName;
            });
            _logEntry('moveTable server: ' + shift.segment[i].visits[g].visitServer + ' oldTable ' + floorPlans[floorPlanIndex].tables[index].name +
              ' newTable ' + tableName);
            break;
          }
        }
        if (foundTable == true) break;
      }
    } else {
      print('edit empty table');
      _logEntry('_moveTable emptyTable');
    }
  }

  _manualAssignTable(int index) async {
    if(floorPlans[floorPlanIndex].tables[index].server == '') {
      String serverName = await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new AssignServerName())
      );
      int newGuests = await Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new GuestEntry())
      );
      int serverIndex = 0;
      bool serverFound = false;
      if(newGuests > 0) {
        for(int i = 0 ; i < shift.shiftServers.length ; i++) {
          if(serverName == shift.shiftServers[i].name){
            serverFound = true;
            serverIndex = i;
          }
        }
        if(serverFound == true) {
          shift.shiftServers[serverIndex].guestThisShift += newGuests;
          if(shift.shiftServers[serverIndex].guestHoldover > newGuests) {
            shift.shiftServers[serverIndex].guestHoldover -= newGuests;
          } else {
            shift.shiftServers[serverIndex].guestThisSegment += (newGuests - shift.shiftServers[serverIndex].guestHoldover);
            shift.shiftServers[serverIndex].guestHoldover = 0;
          }
          setState(() {
            shift.segment[shift.segment.length-1].visits.add(VisitLog(
            visitStart: DateTime.now(),
            visitServer: shift.shiftServers[serverIndex].name,
            visitTable: floorPlans[floorPlanIndex].tables[index].name,
            visitGuestCount: newGuests));
            floorPlans[floorPlanIndex].tables[index].server = shift.shiftServers[serverIndex].name;
          });
          _logEntry('manualAssignTable visitServer ' + shift.shiftServers[serverIndex].name +
              ' visitTable ' + floorPlans[floorPlanIndex].tables[index].name +
              ' visitGuestCount ' + newGuests.toString());
        } else {
          _logEntry('manualAssignTable serverNotFound');
        }
      }//if newGuest > 0
      else {
        _logEntry('manualAssignTable newGuest <= 0');
      }
    } else {
      print('edit empty table');
      _logEntry('manualAssignTable alreadyAssigned Table');
    }
  }

  _reassignLastVisit(int index) async {
    bool foundTable = false;
    _logEntry('reassignLastVisit ' + ' table ' + floorPlans[floorPlanIndex].tables[index].name);
    for (int i = (shift.segment.length - 1); i >= 0; i--) {
      for (int g = (shift.segment[i].visits.length - 1); g >= 0; g--) {
        //print('$i/$g:' + shift.segment[i].visits[g].visitTable + ' ' + floorPlans[floorPlanIndex].tables[index].name);
        if (shift.segment[i].visits[g].visitTable == floorPlans[floorPlanIndex].tables[index].name
            && foundTable == false) {
          foundTable = true;
          setState(() {
            floorPlans[floorPlanIndex].tables[index].server = shift.segment[i].visits[g].visitServer;
            shift.segment[i].visits[g].visitEnd = null;
          });
          _logEntry('reassignLastVisit server ' + shift.segment[i].visits[g].visitServer +
              ' table ' + floorPlans[floorPlanIndex].tables[index].name);
          break;
        }
      }
      if (foundTable == true) break;
    }
  }

  _tableOptions(int index) async {
    switch (await showDialog<DialogOptions>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Option',
            style: new TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              //color: Colors.white,
            )),
          children: [
            SimpleDialogOption(
              onPressed: () { Navigator.pop(context, DialogOptions.editGuestCount); },
              child: Text('Edit Guest Count',
                  style: new TextStyle(
                    fontSize: 28,
                    //fontWeight: FontWeight.bold,
                    //color: Colors.white,
                  )),
            ),
            SimpleDialogOption(
              onPressed: () { Navigator.pop(context, DialogOptions.manualAssign); },
              child: Text('Manually Assign Table',
                style: new TextStyle(
                fontSize: 28,
                //fontWeight: FontWeight.bold,
                //color: Colors.white,
                )),
            ),
            SimpleDialogOption(
              onPressed: () { Navigator.pop(context, DialogOptions.clear); },
              child: Text('Clear Table',
                style: new TextStyle(
                  fontSize: 28,
                  //fontWeight: FontWeight.bold,
                  //color: Colors.white,
                )),
            ),
            SimpleDialogOption(
              onPressed: () { Navigator.pop(context, DialogOptions.move); },
              child: Text('Move Table',
                style: new TextStyle(
                  fontSize: 28,
                  //fontWeight: FontWeight.bold,
                  //color: Colors.white,
                )),
            ),
            SimpleDialogOption(
              onPressed: () { Navigator.pop(context, DialogOptions.reassignLastVisit); },
              child: Text('Reassign Last Visit',
                style: new TextStyle(
                fontSize: 28,
                //fontWeight: FontWeight.bold,
                //color: Colors.white,
              )),
            ),
          ],
        );
      }
    )) {
      case DialogOptions.editGuestCount:
        _editGuestCount(index);
        break;
      case DialogOptions.manualAssign:
        _manualAssignTable(index);
        break;
      case DialogOptions.clear:
        _clearTable(index);
        break;
      case DialogOptions.move:
        _moveTable(index);
        break;
      case DialogOptions.reassignLastVisit:
        _reassignLastVisit(index);
        break;
    }
  }

  Widget getTableWidget(int index) {
    if(floorPlans[floorPlanIndex].tables[index].server == null){
      setState((){
        floorPlans[floorPlanIndex].tables[index].server = '';
      });

    }

    return Material(
        child: Container(
            width: 100,
            height: 100,
            child: Padding(
                padding: EdgeInsets.all(5),
                child:InkWell(
                    onTap: () => _tableAssign(index),
                    onLongPress: () => _tableOptions(index),
                    child: Container(
                        decoration: BoxDecoration(
                          shape: _tableGetShape(floorPlans[floorPlanIndex].tables[index].shape),
                          color: _tableGetColor(floorPlans[floorPlanIndex].tables[index].server),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                          child: Text(
                              _tableGetLabel(
                                  floorPlans[floorPlanIndex].tables[index].server,
                                  floorPlans[floorPlanIndex].tables[index].name),
                              style: new TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                          ),
                        )
                    )
                )
            )
        )
    );
  }



  List<Widget> _buildServerTiles() {
    List<Widget> widgets = [];
    if(shift.shiftServers != null) {
      widgets = new List(shift.shiftServers.length);
      for (int i = 0; i < shift.shiftServers.length; i++) {
        //widgets[i] = new ServerTile(shift: shift, index: i,);
        widgets[i] = Material(
            child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: _serverGetColor(shift.shiftServers[i].isNext),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        shift.shiftServers[i].name,
                        style: new TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                        child: Text(
                          shift.shiftServers[i].guestThisShift.toString()
                              + ',' + shift.shiftServers[i].guestHoldover.toString(),
                          style: new TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),
                    Switch(
                      value: shift.shiftServers[i].isActive,
                      onChanged: (bool value) {
                        setState(() {
                          shift.newSegment(DateTime.now());
                          shift.shiftServers[i].isActive = value;
                          nextServerIndex = shift.nextServer();
                        });
                        _logEntry('serverStatusUpdate ' + shift.shiftServers[i].name + ' status ' + shift.shiftServers[i].isActive.toString());
                      },
                    )
                  ],
                )
            )

        );
      }
      return widgets;
    } else {
      widgets.add(Text('No Servers'));
      return widgets;
    }
  }

  void _decrementFloorPlan() {
    int _tempIndex = floorPlanIndex;
    if(_tempIndex == 0) {
      _tempIndex = floorPlanMaxIndex;
    } else {
      _tempIndex--;
    }
    setState(() {
      floorPlanIndex = _tempIndex;
    });
    _logEntry('_decrementFloorPlan ' + _tempIndex.toString());
  }

  void _incrementFloorPlan() {
    int _tempIndex = floorPlanIndex;
    _tempIndex++;
    if(_tempIndex > floorPlanMaxIndex) {
      _tempIndex = 0;
    }
    setState(() {
      floorPlanIndex = _tempIndex;
    });
    _logEntry('_incrementFloorPlan ' + _tempIndex.toString());
  }

  _navigateToShiftSummary () async {
    _logEntry('navigateToShiftSummary');
    Shift _shift = await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new ShiftSummary(shift: shift,))
    );
    if(_shift != null){
      setState(() {
        shift = _shift;
      });
    }
  }

  _addServer () async {
    String _serverName = await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new ServerName())
    );
    if(_serverName != null && shift.shiftServers != null){
      setState(() {
        shift.newSegment(DateTime.now());
        shift.shiftServers.add(new ServerObject(name: _serverName));
        nextServerIndex = shift.nextServer();
      });
    } else if (_serverName != null){
      setState(() {
        shift.shiftServers = new List.from(widget.restaurant.servers.getRange(0, 2));
        shift.shiftServers.add(new ServerObject (name: _serverName));
        shift.shiftServers.removeRange(0, 2);
      });
      shift.newSegment(DateTime.now());
      nextServerIndex = shift.nextServer();
      //print('Made It ' + shift.shiftServers.length.toString());
      //shift.shiftServers.add(new ServerObject(name: _serverName));
    }
    print(shift.shiftServers);
    _logEntry('addServer ' + _serverName + ' nextIndex $nextServerIndex');
    _refreshFunction();
  }

  _refreshFunction() {
    if(shift.shiftServers != null) {
      for (int i = 0; i < shift.shiftServers.length; i++) {
        setState(() {
          shift.shiftServers[i].isNext = false;
        });
      }
      setState(() {
        nextServerIndex = shift.nextServer();
        shift.shiftServers[nextServerIndex].isNext = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //timer = new Timer.periodic(refreshRate, (Timer t) => _refreshFunction());

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                      color: Colors.black,
                      width:2,
                      style: BorderStyle.solid
                    )
                ),
            ),
            child: Column(
              children: <Widget>[
                Container(height:23, decoration: BoxDecoration(color: Colors.black),),
                Container(
                  height: 40,
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  child:
                    ButtonTheme(
                      height: 40,
                      minWidth: 300,
                      child: FlatButton(
                        child: Text('Shift Summary', style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        )),
                        onPressed: _navigateToShiftSummary,
                        color: Colors.lightBlueAccent,

                      )
                    )
                ),
                Container(
                    height: 40,
                    decoration: BoxDecoration(color: Colors.lightBlueAccent),
                    child:
                    ButtonTheme(
                        height: 40,
                        minWidth: 300,
                        child: FlatButton(
                          child: Text('Add Server', style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          )),
                          onPressed: _addServer,
                          color: Colors.blueAccent,

                        )
                    )
                ),
                Container(
                  height: MediaQuery.of(context).size.height-103,
                  child: ListView (
                    children:
                    _buildServerTiles()
                  )
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(height:23, decoration: BoxDecoration(color: Colors.black),),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent
                  ),
                  child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_left),
                          onPressed: _decrementFloorPlan,
                          color: Colors.white,
                        ),
                        Text(floorPlans[floorPlanIndex].roomName,
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Colors.white),
                        ),
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_right),
                          onPressed: _incrementFloorPlan,
                          color: Colors.white,
                        ),
                      ]
                  ),
                ),
                Expanded(
                  child: CustomMultiChildLayout(
                    delegate: FloorPlanDelegate(),
                    children: _getFloorPlanWidgets(),
                  )
                )
              ],
            ),
          ),
        ], // <Widget>[]
      ),
    );
  }
}
