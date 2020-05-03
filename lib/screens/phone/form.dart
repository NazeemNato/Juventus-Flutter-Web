import 'package:flutter/material.dart';
import 'package:juventusRuling/screens/phone/dob_home.dart';

class FormPage extends StatefulWidget {
  FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _dm;
  checkFields() {
    final form = _formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JRC ~ Who was born on my birthday 🎂?',
          style: TextStyle(fontFamily: 'jrc'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          height: 250.0,
          width: 300.0,
          child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 20.0, bottom: 5.0),
              child: Container(
                height: 50.0,
                child: TextFormField(
                  validator: (input) {
                    if (input.length > 5 || input.length < 5) {
                      return 'Enter DD/MM';
                    }
                    if (input.isEmpty) {
                      return 'Empty';
                    }
                    if (!input.contains('/')) {
                      return 'Enter DD/MM like this 25/12';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'DOB 🍼',
                    hintText: 'DD/MM',
                    contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.0)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _dm = value;
                    });
                  },
                ),
              )),
          RaisedButton(
            onPressed: () {
              if (checkFields()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DobHomeScreen(
                              dob: _dm,
                            ),
                        fullscreenDialog: true));
              }
            },
            child: Text(
              'SHOW ME 🎉',
              style: TextStyle(
                  fontFamily: 'jrc',
                  fontSize: 30,
                  color: Colors.white),
            ),
            color: Colors.black,
          )
                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}
