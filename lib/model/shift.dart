import 'package:meta/meta.dart';
import 'package:restaurant_app/model/server_object.dart';
import 'package:restaurant_app/model/segment.dart';
import 'package:restaurant_app/model/visit_log.dart';

class Shift {
  DateTime day;
  List<ServerObject> shiftServers = [];
  List<Segment> segment = [];
  Duration sittingGap = Duration(minutes: 6);

  Shift({
    @required this.day,
    @required this.shiftServers,
  })  : assert(day != null);

  void newSegment (DateTime time) {
    //print('newSegment');
    if(segment.length > 0) {
      segment[segment.length - 1].end = time;
    }
    segment.add(Segment(start: time));
    print('newSegment:' + segment.length.toString());
    int maxGuestCount = 0;
    for (int i = 0 ; i<shiftServers.length ; i++) {
      if(maxGuestCount < shiftServers[i].guestThisSegment) {
        maxGuestCount = shiftServers[i].guestThisSegment;
      }
    }

    for (int i = 0 ; i<shiftServers.length ; i++) {
      if(shiftServers[i].lastSeating == null) shiftServers[i].lastSeating = DateTime.now().subtract(sittingGap);
      if(shiftServers[i].isActive == true) {
        shiftServers[i].guestHoldover = shiftServers[i].guestHoldover + maxGuestCount-shiftServers[i].guestThisSegment;
        //shiftServers[i].guestThisShift = shiftServers[i].guestThisShift + shiftServers[i].guestThisSegment;
        shiftServers[i].guestThisSegment = 0;
        print(shiftServers[i].name + ' ' + shiftServers[i].guestHoldover.toString());
      }
      //print(shiftServers[i].name + ' ' + shiftServers[i].guestHoldover.toString());
    }
  }

  int nextServer() {
    int maxHoldoverIndex, minGuestThisSegmentIndex, minGuestThisShiftIndex;
    int index = 0;
    List<int> validServersIndex = [];


    for(int i = 0 ; i < shiftServers.length ; i++) {
      if(shiftServers[i].lastSeating == null) shiftServers[i].lastSeating = DateTime.now().subtract(sittingGap);
    }

    print('shiftServers.length: ' + shiftServers.length.toString());
    for(int i = 0 ; i < shiftServers.length ; i++) {
      print(shiftServers[i].name.toString() + ':' + shiftServers[i].isActive.toString());
      if(shiftServers[i].isActive == true) {
          //&&(shiftServers[i].lastSeating.add(sittingGap).isAfter(DateTime.now()))) {
        validServersIndex.add(i);
      }
    }
    if(validServersIndex.isEmpty) {
      for(int i = 0 ; i < shiftServers.length ; i++) {
        if(shiftServers[i].isActive == true) {
          validServersIndex.add(i);
        }
      }
    }

    maxHoldoverIndex = validServersIndex[0];
    minGuestThisShiftIndex = validServersIndex[0];
    minGuestThisSegmentIndex = validServersIndex[0];

    print('validServers: ' + validServersIndex.length.toString());

    for(int i = 0 ; i < validServersIndex.length ; i++) {
      print('index : ' + validServersIndex[i].toString());
      if(shiftServers[validServersIndex[i]].guestHoldover > shiftServers[maxHoldoverIndex].guestHoldover
          &&shiftServers[validServersIndex[i]].isActive == true) {
        maxHoldoverIndex = validServersIndex[i];
      }
      if(shiftServers[validServersIndex[i]].guestThisSegment < shiftServers[minGuestThisSegmentIndex].guestThisSegment
          &&shiftServers[validServersIndex[i]].isActive == true) {
        minGuestThisSegmentIndex = validServersIndex[i];
      }
      if(shiftServers[validServersIndex[i]].guestThisShift < shiftServers[minGuestThisShiftIndex].guestThisShift
          &&shiftServers[validServersIndex[i]].isActive == true) {
        minGuestThisShiftIndex = validServersIndex[i];
      }
      print(shiftServers[validServersIndex[i]].name + ' ' + shiftServers[validServersIndex[i]].guestHoldover.toString()
        + ' ' + shiftServers[validServersIndex[i]].guestThisSegment.toString()
        + ' ' + shiftServers[validServersIndex[i]].guestThisShift.toString()
        + ' ' + shiftServers[validServersIndex[i]].isActive.toString());
    }

    if(shiftServers[minGuestThisShiftIndex].guestThisShift == 0) {
      index = minGuestThisShiftIndex;
    }
    else if(shiftServers[maxHoldoverIndex].guestHoldover > 0) {
      index = maxHoldoverIndex;
    }
    else {
      index = minGuestThisSegmentIndex;
    }
    print('Index: ' + index.toString());
    return index;
  }

  void assignTable(String table, int guestCount, int index) {
    shiftServers[index].guestThisShift += guestCount;
    if (shiftServers[index].guestHoldover >= guestCount) {
      shiftServers[index].guestHoldover =
          shiftServers[index].guestHoldover - guestCount;
    } else {
      shiftServers[index].guestThisSegment += (guestCount - shiftServers[index].guestHoldover);
      shiftServers[index].guestHoldover = 0;
    }
    segment[segment.length-1].visits.add(VisitLog(
        visitStart: DateTime.now(),
        visitServer: shiftServers[index].name,
        visitTable: table,
        visitGuestCount: guestCount));
    shiftServers[index].lastSeating = DateTime.now();
  }

  /*void assignTable(String table, int guestCount) {
    int maxHoldoverIndex, minGuestThisSegmentIndex, minGuestThisShiftIndex;
    int index = 0;
    List<int> validServersIndex = [];

    for(int i = 0 ; i < shiftServers.length ; i++) {
      if(shiftServers[i].lastSeating == null) shiftServers[i].lastSeating = DateTime.now().subtract(sittingGap);
    }

    for(int i = 0 ; i < shiftServers.length ; i++) {
      if(shiftServers[i].isActive == true
          &&(shiftServers[i].lastSeating.add(sittingGap).isAfter(DateTime.now()))) {
        validServersIndex.add(i);
      }
    }
    if(validServersIndex.isEmpty) {
      for(int i = 0 ; i < shiftServers.length ; i++) {
        if(shiftServers[i].isActive == true) {
          validServersIndex.add(i);
        }
      }
    }

    print('validServers: $validServersIndex');

    maxHoldoverIndex = validServersIndex[0];
    minGuestThisShiftIndex = validServersIndex[0];
    minGuestThisSegmentIndex = validServersIndex[0];

    for(int i = 0 ; i < validServersIndex.length ; i++) {
      print('index : ' + validServersIndex[i].toString());
      if(shiftServers[validServersIndex[i]].guestHoldover > shiftServers[maxHoldoverIndex].guestHoldover
          &&shiftServers[validServersIndex[i]].isActive == true) {
        maxHoldoverIndex = validServersIndex[i];
      }
      if(shiftServers[validServersIndex[i]].guestThisSegment < shiftServers[minGuestThisSegmentIndex].guestThisSegment
          &&shiftServers[validServersIndex[i]].isActive == true) {
        minGuestThisSegmentIndex = validServersIndex[i];
      }
      if(shiftServers[validServersIndex[i]].guestThisShift < shiftServers[minGuestThisShiftIndex].guestThisShift
          &&shiftServers[validServersIndex[i]].isActive == true) {
        minGuestThisShiftIndex = validServersIndex[i];
      }
      //print(shiftServers[validServersIndex[i]].name + ' ' + shiftServers[validServersIndex[i]].guestHoldover.toString()
      //  + ' ' + shiftServers[validServersIndex[i]].guestThisSegment.toString()
      //  + ' ' + shiftServers[validServersIndex[i]].guestThisShift.toString()
      //  + ' ' + shiftServers[validServersIndex[i]].isActive.toString());
    }
    //print('HI: $maxHoldoverIndex , SegI: $minGuestThisSegmentIndex , Shift: $minGuestThisShiftIndex');

    if(shiftServers[minGuestThisShiftIndex].guestThisShift == 0) {
      print('minGuest[$minGuestThisShiftIndex]: ' + shiftServers[minGuestThisShiftIndex].guestThisShift.toString());
      if(shiftServers[minGuestThisShiftIndex].guestHoldover > 0) {
        if (shiftServers[minGuestThisShiftIndex].guestHoldover >= guestCount) {
          shiftServers[minGuestThisShiftIndex].guestHoldover =
              shiftServers[minGuestThisShiftIndex].guestHoldover - guestCount;
        } else
        if (shiftServers[minGuestThisShiftIndex].guestHoldover < guestCount) {
          shiftServers[minGuestThisShiftIndex].guestThisSegment =
              guestCount - shiftServers[minGuestThisShiftIndex].guestHoldover;
          shiftServers[minGuestThisShiftIndex].guestHoldover = 0;
        }
      } else {
        shiftServers[minGuestThisShiftIndex].guestThisSegment = shiftServers[minGuestThisShiftIndex].guestThisSegment + guestCount;
      }
      shiftServers[minGuestThisShiftIndex].guestThisShift =  shiftServers[minGuestThisShiftIndex].guestThisShift + guestCount;
      index = minGuestThisShiftIndex;
    }
    else if(shiftServers[maxHoldoverIndex].guestHoldover > 0) {
      print('guestHoldover[$maxHoldoverIndex]: ' + shiftServers[maxHoldoverIndex].guestHoldover.toString());
      if(shiftServers[maxHoldoverIndex].guestHoldover >= guestCount) {
        shiftServers[maxHoldoverIndex].guestHoldover = shiftServers[maxHoldoverIndex].guestHoldover - guestCount;
      } else if(shiftServers[maxHoldoverIndex].guestHoldover < guestCount) {
        shiftServers[maxHoldoverIndex].guestThisSegment = guestCount - shiftServers[maxHoldoverIndex].guestHoldover;
        shiftServers[maxHoldoverIndex].guestHoldover = 0;
      }

      shiftServers[maxHoldoverIndex].guestThisShift =  shiftServers[maxHoldoverIndex].guestThisShift + guestCount;
      index = maxHoldoverIndex;
    }
    else {
      print('minSegment[$minGuestThisSegmentIndex]: ' + shiftServers[minGuestThisSegmentIndex].guestThisSegment.toString());
      shiftServers[minGuestThisSegmentIndex].guestThisSegment = shiftServers[minGuestThisSegmentIndex].guestThisSegment + guestCount;
      shiftServers[minGuestThisSegmentIndex].guestThisShift =  shiftServers[minGuestThisSegmentIndex].guestThisShift + guestCount;
      index = minGuestThisSegmentIndex;
    }
    segment[segment.length-1].visits.add(VisitLog(
        visitStart: DateTime.now(),
        visitServer: shiftServers[index].name,
        visitTable: table,
        visitGuestCount: guestCount));
    shiftServers[index].lastSeating = DateTime.now();
  }*/

  void unassignTable(String table){
    bool foundTable = false;
    print('unassignTable $table');
    int iStart = (segment.length);
    int gStart = (segment[iStart-1].visits.length);
    print('$iStart/$gStart');
    for (int i = (segment.length-1) ; i >= 0 ; i--) {
      for (int g = (segment[i].visits.length-1) ; g >= 0 ; g--) {
        if(segment[i].visits[g].visitTable == table && foundTable == false) {
          foundTable = true;
          segment[i].visits[g].visitEnd = DateTime.now();
          print('$i,$g');
          break;
        }
      }
      if(foundTable == true) break;
    }
  }

}

