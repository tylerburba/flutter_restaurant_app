import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:restaurant_app/model/shift.dart';
import 'package:restaurant_app/widgets/visit_tile.dart';

const _padding = EdgeInsets.all(16.0);

class ShiftSummary extends StatefulWidget {
  final Shift shift;

  const ShiftSummary({
    Key key,
    @required this.shift,
  })  : assert(shift != null),
        super(key: key);

  @override
  _ShiftSummaryState createState() => _ShiftSummaryState();
}

class _ShiftSummaryState extends State<ShiftSummary> {

  @override
  void initState() {
    super.initState();
  }

  _buildShiftSummary() {
    List<Widget> widgets = [];

    for(int i = 0 ; i < widget.shift.segment.length ; i++) {
      for(int g = 0; g < widget.shift.segment[i].visits.length ; g++) {
        widgets.add(new VisitTile(shift: widget.shift, iIndex: i, gIndex: g));
      }
    }
    return widgets;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print (directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/shiftSummary.txt');
  }

  Future<File> writeFile(String string) async {
    final file = await _localFile;
    return file.writeAsString(string);
  }

  _saveShift() async {
    String filePath = "/storage/emulated/0/Documents/ShiftSummary-"+ DateTime.now().toIso8601String().substring(0,19) +".txt";
//    try {
//      filePath = await FilePicker.getFilePath(type: FileType.ANY);
//      if(filePath == '') {
//        return;
//      }
//      print("File path: " + filePath);
//    } catch(e) {
//      print("Error while picking this file: " + e.toString());
//    }

    String shiftDetails = "Report generated: " + DateTime.now().toIso8601String().substring(0,19) + "\n";

    for(int i = 0 ; i < widget.shift.segment.length ; i++) {
      for(int g = 0; g < widget.shift.segment[i].visits.length ; g++) {
        shiftDetails = shiftDetails + widget.shift.segment[i].visits[g].visitStart.toIso8601String().substring(0,16) + ',';
        shiftDetails = shiftDetails + widget.shift.segment[i].visits[g].visitServer + ',' + widget.shift.segment[i].visits[g].visitGuestCount.toString() + ',';
        shiftDetails = shiftDetails + widget.shift.segment[i].visits[g].visitTable + ',';
        if(widget.shift.segment[i].visits[g].visitEnd != null) {
          shiftDetails = shiftDetails + widget.shift.segment[i].visits[g].visitEnd.toIso8601String().substring(0,16) +"\n";
        } else {
          shiftDetails = shiftDetails + 'Ongoing\n';
        }
      }
    }

    writeFile(shiftDetails);
    File file = new File(filePath);
    file.writeAsStringSync(shiftDetails);
    print(filePath);
    print(shiftDetails);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          'Shift Summary',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Settings',
            onPressed: () {
              _saveShift();
            },
          ),
        ],
      ),
      body: Padding(
        padding: _padding,
        child: ListView(
          children: _buildShiftSummary(),
        )
      ),
      resizeToAvoidBottomPadding: true,
    );


  }
}