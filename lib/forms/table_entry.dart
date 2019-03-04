import 'package:flutter/material.dart';


const _padding = EdgeInsets.all(16.0);

class TableEntry extends StatefulWidget {

  @override
  _TableEntryState createState() => _TableEntryState();
}

class _TableEntryState extends State<TableEntry> {
  String _tableName = '';
  bool _showValidationError = false;

  @override
  void initState() {
    super.initState();
  }

  void _updateInputGuests(String input) {
    setState(() {
      if (input == null || input.isEmpty) {
      } else {
        // Even though we are using the numerical keyboard, we still have to check
        // for non-numerical input such as '5..0' or '6 -3'
        try {
          _showValidationError = false;
          _tableName = input;
        } on Exception catch (e) {
          print('Error: $e');
          _showValidationError = true;
        }
      }
    });
  }

  void _moveTable() {
    String _tempString = _tableName;
    Navigator.pop(context, _tempString);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          'Move Table',
          style: Theme.of(context).textTheme.display1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              style: Theme.of(context).textTheme.display2,
              autofocus: true,
              decoration: InputDecoration(
                labelStyle: Theme.of(context).textTheme.display2,
                errorText: _showValidationError ? 'Invalid number entered' : null,
                labelText: 'New Table',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: _updateInputGuests,
            ),
            ButtonTheme(
                height: 80,
                child: RaisedButton(
                  child: Text('Move Table', style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                  )),
                  onPressed: _moveTable,
                  color: Theme.of(context).accentColor,

                )
            )
          ],
        ),
      ),
      resizeToAvoidBottomPadding: true,
    );


  }
}