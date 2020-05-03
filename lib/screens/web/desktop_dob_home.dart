import 'package:flutter/material.dart';
import 'package:juventusRuling/models/Services.dart';
import 'package:juventusRuling/models/data.dart';

class DeskDobHomeScreen extends StatefulWidget {
  DeskDobHomeScreen({Key key, @required this.dob}) : super(key: key);
  final String dob;
  @override
  _DeskDobHomeScreenState createState() => _DeskDobHomeScreenState();
}

class _DeskDobHomeScreenState extends State<DeskDobHomeScreen> {
  List<PlayerData> playerData = List();
  bool _isTrue = true;
  @override
  void initState() {
    super.initState();
    setState(() {
      Services.getData().then((value) {
        setState(() {
          playerData = value
              .where((element) =>
                  (element.dateAndMonth.toString().contains(widget.dob)))
              .toList();
        _isTrue = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.dob);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'JRC ~ Juventus player born on ' + widget.dob,
            style: TextStyle(fontFamily: 'jrc',
            fontSize: 30
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: _isTrue ? Center(child: CircularProgressIndicator(),) : Column(
          children: <Widget>[
            Expanded(
              child: playerData.isEmpty
                  ? Center(child: Text('No Data',
                  style: TextStyle(fontFamily: 'jrc',fontSize: 60),
                  ))
                  : ListView.builder(
                    padding:  EdgeInsets.only(left: 150, right: 150),
                      itemCount: playerData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return playerCard(
                          playerData[index].name,
                          playerData[index].position,
                          playerData[index].dob,
                          playerData[index].image
                        );
                      },
                    ),
            ),
          ],
        ));
  }
  Widget playerCard(name,position,dob,img){
    return Container(
      height: 130,
      child: Card(
        elevation: 10,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(img,),
                  //fit: BoxFit.cover
                  )
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
            child:Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Expanded(child: Text('$name',style:  TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,fontFamily: 'jrc'))),
              SizedBox(height: 2,),
                Text('$position',style:  TextStyle(fontSize: 25, color: Colors.white60,
                fontFamily: 'jrc')),
                Text('$dob',style:  TextStyle(fontSize: 25.0, color: Colors.white60,fontFamily: 'jrc')),
              ],)
            )
            )
          ],
        ),
      ),
    );
    
  }
}
