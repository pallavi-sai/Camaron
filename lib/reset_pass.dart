import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'resetpassword.dart';
void main() =>runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new ResetPass(),
    );
  }
}
class ResetPass extends StatefulWidget{
  @override
  _ResetPassState createState() => new _ResetPassState();

}
class _ResetPassState extends State<ResetPass> {

  String phoneNo;
  String smsCode;
  String verificationId;

  Future<void>verifyPhone() async{
    final PhoneCodeAutoRetrievalTimeout autoRetrieve =(String verId){
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId,[int forceCodeResend]){
      this.verificationId = verId;
      smsCodeDialog(context).then((value){
        print('Signed in');

      });
    };

    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user){
      print('verify');
    };

    final PhoneVerificationFailed veriFailed = (AuthException ex){
      print('${ex.message}');
    };



    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }
  Future<bool> smsCodeDialog(BuildContext context){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter sms Code'),
            content: TextField(
              onChanged: (value){
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                  child:Text('Done'),
                  onPressed: () {
                    FirebaseAuth.instance.currentUser().then((user){
                      if(user!=null){
                        Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute<Null>(
          builder: (BuildContext context) {
                        return new ResetPasswordPage();
                        }
                        )
                        );
                      }
                      else{
                        Navigator.of(context).pop();
                        signIn();
                      }
                    });
                  })
            ],
          );
        }
    );
  }
  signIn(){
    FirebaseAuth.instance.signInWithPhoneNumber( verificationId: verificationId,smsCode: smsCode )
        .then((user){
      Navigator.of(context).push(MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return new ResetPasswordPage();
          }));
    }).catchError((e){
      print(e);
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Forgot Password'),
      ),
      body: new Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter phone number(+91XXXXXXXXXX)',

                ),
                keyboardType: TextInputType.phone,
                onChanged: (value){
                  this.phoneNo = value;
                },
              ),
              RaisedButton(
                onPressed: verifyPhone,
                child: Text('verify'),
                textColor: Colors.white,
                elevation: 7.0,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}