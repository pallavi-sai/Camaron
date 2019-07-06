import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dashboard.dart';
void main()
{
  runApp(new Faqs());
}

//class Faq extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Generated App',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//        primaryColor: const Color(0xFF2196f3),
//
//        fontFamily: 'Roboto',
//      ),
//      home: new MyHomePage(),
//    );
//  }
//}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key}) : super(key: key);
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//  final dio = new Dio();
//  Widget _appBarTitle = new Text('Search..');
//  Icon _searchIcon = new Icon(Icons.search);
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('FAQs Page  '),
//      ),
//      body:
//      new Row(
//          mainAxisAlignment: MainAxisAlignment.start,
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.end,
//          children: <Widget>[
//            new Center(
//              child: new Text('Hello world')
//            )
//          ]
//
//      ),
//
//    );
//  }
//}
//
//


// ignore: public_member_api_docs
class Faqs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //final title = 'FAQs';
    return MaterialApp(
       // title: title,
        home: Scaffold(
          appBar: AppBar(
            title: new Text('FAQs'),
           //   automaticallyImplyLeading: true,
              backgroundColor: Colors.green,
              leading: IconButton(icon: Icon(Icons.arrow_back),
                  //alignment: Alignment(0,0.3),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                              return new Dashboard();
                            }
                        )
                    );

                  }
              )

          ),


          body: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.looks_one),
                  title: Text('What is the warranty for Camaron?''\n''\n'
                   'The Camaron(Model RCW19) comes with a one year limited warranty from the date of purchase.''\n''\n',
                    style: TextStyle(color:Colors.black)
                  ),

        ),
                ListTile(
                  leading: Icon(Icons.looks_two),
                  title: Text('Can I extend my warranty?''\n''\n'
                  'Yes, you can extend the warranty by paying a small fee within a year of the installation. However, you can avail a discount on the extended warranty, if you subscribe to it at the time of device purchase.''\n''\n'),
                ),
                ListTile(
                  leading: Icon(Icons.looks_3),
                  title: Text('Under what circumstances is my warranty void?''\n''\n'
                  'The warranty is void when:''\n'
                  'When the tamper-proof seal is broken.''\n'
                  'When you submerge the box in water.''\n'
                  'When you relocate the box without informing the Robic Rufarm.''\n''\n'
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.looks_4),
                  title: Text('When my warranty is void, can I still avail the paid service?''\n''\n'
                  'Yes. Log a service request and the Robic Rufarm executive will evaluate the request and gives you the service quotation.'),
                ),
                ListTile(
                  leading: Icon(Icons.looks_5),
                  title: Text('\n''\n''What should I do when I want to shift the device to a new pond/location?''\n''\n'
                  'Please call the Robic Rufarm support team and log a service request. The support will assign a technician/implementer who is trained to handle the relocation and redeployment of the device.'),


                ),
                ListTile(
                    leading: Icon(Icons.looks_6),
                    title: Text('\n''\n''Will I be charged a fee for relocation, if I am still covered under warranty?'
                        '\n''\n''Yes, please contact the support team at info@robicrufarm.com to know the service cost to relocate the device.'),

                    onTap: () {
//
                          }),
                ListTile(
                  leading: Icon(Icons.looks),
                  title: Text('\n''\n''Do I need any proof of purchase to claim the warranty?'
                      '\n''\n''As long as the device is acquired directly from Robic Rufarm or any of its distributors, you don’t need any proof of purchase''\n''\n'),
                ),
                ListTile(
                 title: Text('For more information visit our website : Click Here',style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: ()
                  {
                    launch('https://robicrufarm.com/camaron/');

                  },

                ),
//                ListTile(
//                 leading:Icon(Icons.copyright),
//                  title: Text('Robic Rufarm',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w100),),
//
//                ),

      ]
    )
    ),
    );
  }

}
