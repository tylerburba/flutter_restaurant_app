import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/model/shift.dart';

// We use an underscore to indicate that these variables are private.
// See https://www.dartlang.org/guides/language/effective-dart/design#libraries

/// A [CategoryTile] to display a [Category].
class VisitTile extends StatefulWidget {
  final Shift shift;
  final int iIndex, gIndex;


  @override
  _VisitTileState createState() => _VisitTileState();

  VisitTile({
    Key key,
    @required this.shift,
    @required this.iIndex,
    @required this.gIndex
  })  : assert(shift != null),
        assert(iIndex != null),
        assert(gIndex != null),
        super(key: key);
}

class _VisitTileState extends State<VisitTile> {
  String endTime;


  void initState() {
    super.initState();
  }

  void _voidVisit() {
    for(int i = 0 ; i < widget.shift.shiftServers.length ; i++) {
      if(widget.shift.shiftServers[i].name == widget.shift.segment[widget.iIndex].visits[widget.gIndex].visitServer) {
        //widget.shift.shiftServers[i].guestThisShift = widget.shift.shiftServers[i].guestThisShift - widget.shift.visits[widget.index].visitGuestCount;
      }
    }
  }

  void _reactivateVisit() {
    widget.shift.segment[widget.iIndex].visits[widget.gIndex].visitEnd = null;

  }

  @override
  Widget build(BuildContext context) {
    if(widget.shift.segment[widget.iIndex].visits[widget.gIndex].visitEnd != null) {
      endTime = widget.shift.segment[widget.iIndex].visits[widget.gIndex].visitEnd.toIso8601String().substring(0,16);
    } else {
      endTime = 'Ongoing';
    }

    return Material(
        child: Container(
          child: InkWell(
            onLongPress: _reactivateVisit,
            child: Row(
              children: [
                Expanded(
                    child: Text(widget.shift.segment[widget.iIndex].visits[widget.gIndex].visitStart.toIso8601String().substring(0,16))
                ),
                Expanded(
                    child: Text(widget.shift.segment[widget.iIndex].visits[widget.gIndex].visitServer + '-' +
                        widget.shift.segment[widget.iIndex].visits[widget.gIndex].visitGuestCount.toString())
                ),
                Expanded(
                    child: Text(widget.shift.segment[widget.iIndex].visits[widget.gIndex].visitTable)
                ),
                Expanded(
                    child: Text(endTime)
                ),
              ],
            ),
          ),
        ),

    );
  }
}



