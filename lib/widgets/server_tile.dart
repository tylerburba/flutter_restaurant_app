import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/model/server_object.dart';
import 'package:restaurant_app/model/shift.dart';

// We use an underscore to indicate that these variables are private.
// See https://www.dartlang.org/guides/language/effective-dart/design#libraries

/// A [CategoryTile] to display a [Category].
class ServerTile extends StatefulWidget {
  final Shift shift;
  final int index;

  @override
  _ServerTileState createState() => _ServerTileState();

  ServerTile({
    Key key,
    @required this.shift,
    @required this.index
  })  : assert(shift != null),
        assert(index != null),
        super(key: key);
}

class _ServerTileState extends State<ServerTile> {
  bool isNext = false;

  void initState() {
    super.initState();
  }

  Color _serverGetColor() {
    if(isNext) {
      return Colors.blue[100];
    } else {
      return Colors.white;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: _serverGetColor(),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                  widget.shift.shiftServers[widget.index].name,
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
                    widget.shift.shiftServers[widget.index].guestThisShift.toString()
                    + ',' + widget.shift.shiftServers[widget.index].guestHoldover.toString(),
                style: new TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              )
            ),
            Switch(
              value: widget.shift.shiftServers[widget.index].isActive,
              onChanged: (bool value) {
                setState(() {
                  widget.shift.newSegment(DateTime.now());
                  widget.shift.shiftServers[widget.index].isActive = value;
                });

              },
            )
          ],
        )
      )

    );
  }
}