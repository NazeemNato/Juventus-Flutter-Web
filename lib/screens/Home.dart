import 'package:flutter/material.dart';
import 'package:juventusRuling/screens/phone/form.dart';
import 'package:juventusRuling/screens/web/desktopForm.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      if (constraints.maxWidth > 1200) {
        return FormDesktopPage();
      } else if (constraints.maxWidth > 700 && constraints.maxWidth < 1200) {
        return FormDesktopPage();
      }else {
        return FormPage();
      }
    });
  }
}