import 'package:flutter/material.dart';


const _padding = EdgeInsets.all(16.0);

class GuestEntry extends StatefulWidget {

  @override
  _GuestEntryState createState() => _GuestEntryState();
}

class _GuestEntryState extends State<GuestEntry> {
  int _numberGuests = 0;
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
          final inputInt = int.parse(input);
          if(inputInt >= 0) {
            _showValidationError = false;
            _numberGuests = inputInt;
          }
          else {
            print('Error: must be positive value');
            _showValidationError = true;
          }
        } on Exception catch (e) {
          print('Error: $e');
          _showValidationError = true;
        }
      }
    });
  }

  void _addTable() {
    int _tempInt = _numberGuests;
    Navigator.pop(context, _tempInt);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          'Guest Entry',
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
                labelText: 'Number of Guests',
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
                child: Text('Add Table', style: TextStyle(
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