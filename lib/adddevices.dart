  import 'package:flutter/material.dart';

  import 'devicelogin.dart';
  void main()
  {
    runApp(MaterialApp(
      home:Adddevices(),
    ));
  }
  class Adddevices extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      debugPrint(MediaQuery
          .of(context)
          .size
          .height
          .toString());
      final title = 'Add Devices';
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
                  icon: Icon(Icons.arrow_back),
                  tooltip: 'Navigation menu',
                  onPressed: () =>
                    Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                     return new Adddevices();

                    }
                    ),
                    ),
              ),
            ),

            body: new GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanDown: (detail) {
                  print(detail);
  //FocusScope.of.requestFocus(new FocusNode());
                },
                child: new ListView(
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
                            new Text('My Devices',
                                style:
                                new TextStyle(
                                    color: Colors.green, fontSize: 23.0)),
                          ],
                        ),
                      ),
                      new SizedBox(height: 0.0),
                      Row(

                          children: <Widget>[
                                  new Container(
                                  margin: new EdgeInsets.all(10.0),
                            child: new Padding(
                                padding: new EdgeInsets.all(30.0),
                                child: new SizedBox(
                                                  height: 80,
                                                  width: 80,
                                    child: Center(
                                      child: IconButton(
                                          icon: Icon(Icons.add_circle),
                                          color:Colors.green,
                                          alignment: Alignment.center,
                                          iconSize: 100,
                                          tooltip:'Add device',

                                          onPressed: () {
                                            Navigator.of(context).push(
                              MaterialPageRoute<Null>(
                                  builder: (BuildContext context) {
                                      return new DevicePage();
                                  }
                              )
                          );
                        }
                ),
                                    )
                      )


                                               )
                      )

            ]
            ),
              ]
      )
      )
      )
      );
    }

  }
