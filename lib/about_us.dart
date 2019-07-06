import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(new MaterialApp(
  title: 'Forms in Flutter',
  home: new HomePage(),
));

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'home',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('android/image/logo.png'),
        ),
      ),
    );
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Robic Rufarm',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Text(
          ' Robic Rufarm is a team of six members, each with knowledge in various fields of science and agriculture , infrastructured with practical skill and dedicated research with a sharp aim to up raise the quality of life of a farmer.Initially started with two people with a desire to make a difference, now we’re a team of four with the same desire multiplied with a great deal of team spirit , and a zeal to make the dream of seeing farmers happy and stress free, come true.',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
//    final cont = Padding(
//      padding: EdgeInsets.all(8.0),
//      child: Container(
//        child: ListView(
//            children: <Widget>[
//              ListTile(
//                  title: Text(
//                      'For more information'
//                  ),
//                  onTap: () {
//                    launch('www.robicrufarm.com');
//                  })
//            ]),
//      ),
//    );

    final body = Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.green,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[logo, welcome, lorem],

      ),
    );

    return Scaffold(
      body: body,
    );
  }
  }