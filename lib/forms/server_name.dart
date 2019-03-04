import 'package:flutter/material.dart';


const _padding = EdgeInsets.all(16.0);

class ServerName extends StatefulWidget {

  @override
  _ServerNameState createState() => _ServerNameState();
}

class _ServerNameState extends State<ServerName> {
  String _serverName;
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
          final inputString = input;
          _showValidationError = false;
          _serverName = inputString;
        } on Exception catch (e) {
          print('Error: $e');
          _showValidationError = true;
        }
      }
    });
  }

  void _addTable() {
    String tempString = _serverName;
    Navigator.pop(context, tempString);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          'Server Entry',
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
                labelText: 'Server Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              keyboardType: TextInputType.text,
              onChanged: _updateInputGuests,
            ),
            ButtonTheme(
                height: 80,
                child: RaisedButton(
                  child: Text('Add Server', style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                  )),
                  onPressed: _addTable,
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