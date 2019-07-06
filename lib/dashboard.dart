import 'dart:async';
import 'devicelogin.dart';
import 'package:camaron/appbar_forward.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'FAQ.dart';

void main() => runApp(new MaterialApp(
  home: new Dashboard(),
));
class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  var pH,DO,Temp;
  StreamSubscription<DocumentSnapshot> subscription;
var devid;

  final DocumentReference documentReference =
  Firestore.instance.collection("devices").document("12345");
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      setState(() {
        pH = datasnapshot.data['pH'];
        DO = datasnapshot.data['DO'];
        Temp = datasnapshot.data['Temp'];
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery
        .of(context)
        .size
        .height
        .toString());
    final title = 'Dashboard';

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: new AppBar(
            backgroundColor: Colors.green,
            title: new Text('CAMARON', style: TextStyle(color: Colors.white),
              textAlign: TextAlign.end,),
            leading: IconButton(
                icon: Icon(Icons.menu),
                tooltip: 'Navigation menu',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                       return new HomePage();
                    }),
                  );
                }),


            actions: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.question_answer), onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                            return new Faqs();
                        }
                    )
                );
              })
            ],),

//          body: StreamBuilder(
//            stream: Firestore.instance.collection('devices').snapshots(),
//            builder: (context, snapshot){
//              if(!snapshot.hasData) return Text('Loading data... please wait');
//              return Column(
//                children: <Widget>[
//                  Text(snapshot.data.documents[0]['DO']),
//                  Text(snapshot.data.documents[0]['Temp']),
//                  Text(snapshot.data.documents[0]['pH']),
//                ],
//              );
//            },
//          )

          body:  new ListView(
              shrinkWrap: true,
              children: <Widget>[
                new SizedBox(height: 5.0),
                new Container(
                  height: 60.0,
                  color: Colors.white,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.mobile_screen_share,
                          color: Colors.green, size: 30.0),
                      new Padding(
                          padding: const EdgeInsets.only(right: 5.0)),
                      new Text('Device-1',
                          style:
                          new TextStyle(
                              color: Colors.green, fontSize: 23.0)),
                    ],
                  ),
                ),
                new SizedBox(height: 0.0),
                new Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 35),
                  color: Colors.blueGrey,
                  width: 350.0,
                  height: 200.0,
                  child: Text('GRAPH', style: new TextStyle(
                      color: Colors.white, fontSize: 60),),

                  alignment: Alignment.center,),

                Row(

                    children: <Widget>[



                      new Container(
                        margin: EdgeInsets.all(45),
                        color: Colors.green[300].withOpacity(0.0),
                        width: 125.0,
                        height: 125.0,

                        //decoration: new BoxDecoration(color: Colors.yellow,),
                        child: new Text('pH''\n'+
                            pH.toString(), style: new TextStyle(fontSize: 35),
                          textAlign: TextAlign.center,),
                      ),

                      new Container(
                        margin: EdgeInsets.all(30),
                        color: Colors.lightBlueAccent[100].withOpacity(0.0),
                        width: 125.0,
                        height: 125.0,

                        child: new Text(
                          'DO''\n' +
                              DO.toString(), style: new TextStyle(fontSize: 35),
                          textAlign: TextAlign.center,),
                      ),

                    ]
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 0, 100, 0),
                  child: new Container(

                    margin: EdgeInsets.all(20),
                    color: Colors.blueGrey[50].withOpacity(0.0),
                    width: 125.0,
                    height: 125.0,

                    child: new Text('Temp \n'+
                        Temp.toString()+'°C', style: new TextStyle(fontSize: 35),
                      textAlign: TextAlign.center,),

                    // color: Colors.greenAccent,
                    //      decoration: new BoxDecoration(color: Colors.yellow),
                  ),
                ),




                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: new Container(
                    child: new RaisedButton(
                      child: new Text('CALIBERATE',
                        style: new TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: (){


                      },
                      color: Colors.blueAccent,

                    ), //raised button method
                  ), //raised button container
                ), //padding method
//
              ]
          ) //end of list View
        //end of gesture Detector
      ), //end of Scaffold
    ); //end of MaterialApp
  } }