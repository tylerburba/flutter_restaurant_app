import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

const numRows = 7;
const numCols = 9;

// We use an underscore to indicate that these variables are private.
// See https://www.dartlang.org/guides/language/effective-dart/design#libraries

class TableTile extends StatefulWidget {
  final String tableNumber, shape;
  String server;
  bool assigned;

  @override
  _TableTileState createState() => _TableTileState();

  TableTile({
    Key key,
    server,
    assigned,
    @required this.shape,
    @required this.tableNumber,
  })  : assert(tableNumber != null),
        assert(shape != null),
        super(key: key);
}

class _TableTileState extends State<TableTile> {
  String server;
  bool assigned = false;

  @override
  void initState() {
    super.initState();

  }

  String _getLabel() {
    if(server == '') {
      return server;
    } else {
      return widget.tableNumber.toString();
    }
  }

  BoxShape _getShape() {
    if(widget.shape == "square"){
      return BoxShape.rectangle;
    } else {
      return BoxShape.circle;
    }
  }

  Color _getColor() {
    if(assigned == true) {
      return Colors.green;
    } else {
      return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 100,
        height: 100,
        child: Padding(
          padding: EdgeInsets.all(5),
          child:InkWell(
            //onTap: () => ,
            child: Container(
              decoration: BoxDecoration(
                shape: _getShape(),
                color: _getColor(),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Center(
                child: Text(
                  _getLabel(),
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
}