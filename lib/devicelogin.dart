         import 'package:flutter/material.dart';
          import 'dashboard.dart';
          import 'package:cloud_firestore/cloud_firestore.dart';


          class DevicePage extends StatefulWidget {
          @override
          State<StatefulWidget> createState() => new _DevicePageState();
          }

          class _Devicedata {
          var id;
          }

          class _DevicePageState extends State<DevicePage> {
          final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
            // String id;
          _Devicedata _data = new _Devicedata();
          final DocumentReference documentReference= Firestore.instance.collection("DeviceInfo").document();
          void _adding()
            {
              Map<String, String> data = <String, String>{
                "deviceid" : _data.id
              };
              documentReference.setData(data).whenComplete(() {
                print("Document Added");
              }).catchError((e)=> print(e));
            }
          @override
          Widget build(BuildContext context) {
              return new Scaffold(
                appBar: new AppBar(
          backgroundColor:Colors.green,
                    title: new Text('Device Login'),
          ),
                    body: new Container(
          padding: new EdgeInsets.fromLTRB(20,0,20,0),
                    child: new Form(
          key: this._formKey,
                            child: new ListView(
          children: <Widget>[
          new Container(
          height:320.0,
          width:420.0,
          ),
          new TextFormField(
          keyboardType: TextInputType.number,
          // Use email input type for emails.
          decoration: new InputDecoration(
          hintText: 'Enter your ID',
          labelText: 'Device ID',
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          ),
                                  validator: (value) {
                                    if (value.length != 6) {
                                      return "ID must contain 6 digits";
                                    } else {
                                      _data.id = value;
                                    }

                                  },
          onFieldSubmitted : (String value) {
          this._data.id = value;
          print(value);
          }
          ),
          new Container(
          //width: 50,
          child: Padding(
          padding: const EdgeInsets.fromLTRB(80,5,80,0),
          child: new RaisedButton(
          child: new Text(
          'Go',

          style: new TextStyle(
          color: Colors.white
          ),
          ),
          onPressed: () {
          if(_formKey.currentState.validate()){
            _adding();
          Navigator.of(context).push(
          MaterialPageRoute<Null>(
          builder: (BuildContext context){
          return new Dashboard();
          }
          )
          );
          }
          },
          color: Colors.green,
          ),
          ),
          margin: new EdgeInsets.only(
          top: 20.0
          ),
          )
          ],
          ),
          )
          ),
          );
          }
          }


