import 'package:flutter/material.dart';
import 'package:juventusRuling/screens/web/desktop_dob_home.dart';

class FormDesktopPage extends StatefulWidget {
  FormDesktopPage({Key key}) : super(key: key);

  @override
  _FormDesktopPageState createState() => _FormDesktopPageState();
}

class _FormDesktopPageState extends State<FormDesktopPage> {
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
          style: TextStyle(fontFamily: 'jrc',
          fontSize: 30
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height,
          padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height/4),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            left: 25.0,
                            right: 25.0,
                            top: 20.0,
                            bottom: 5.0),
                        child: Container(
                          height: 50.0,
                          child: TextFormField(
                            validator: (input) {
                              if (input.length > 5 ||
                                  input.length < 5) {
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
                              contentPadding: EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(2.0)),
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
                                  builder: (context) => DeskDobHomeScreen(
                                        dob: _dm,
                                      ),
                                  fullscreenDialog: true));
                         // print(_dm);
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
