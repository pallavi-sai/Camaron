
import 'package:flutter/material.dart';
import 'package:path/path.dart';
//import 'package:validate/validate.dart';

import 'dashboard.dart';

void main() => runApp(new MaterialApp(
  title: 'Forms in Flutter',
  home: new ResetPasswordPage()
));

class ResetPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ResetPasswordPageState();
}

class ResetPasswordData {
  String password = '';
}
var passKey = GlobalKey<FormFieldState>();

class ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  ResetPasswordData _data = new ResetPasswordData();

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.

      print('Printing the SignUp data.');
      print('Password: ${_data.password}');
      print('Re-enter Password: ${_data.password}');
    }
  }


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery
        .of(context)
        .size;


    return new Scaffold(
      appBar: new AppBar(
        backgroundColor:Colors.green,
        title: new Text('Reset Password'),
      ),
      body: new Container(

          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[

                new TextFormField(
                    key: passKey,
                    obscureText: true, // Use secure text for passwords.
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      labelText: 'Enter your New password',
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                   ),
                       validator:
                              (String value) {
                       this._data.password = value;

                      var result = _data.password.length < 8 ? "Password should contain atleast 8 characters"
                          : null;
                      return result;
                    }
                ),
                new SizedBox(
                    height:12.0
                ),
                new TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: 'password',
                    labelText: 'Re-enter your password',
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  validator: (confirmation){
                    var password = passKey.currentState.value;
                    return equals(confirmation,password) ? null : "Both passwords must be matched";
                  },
                ),
                new SizedBox(
                    height:12.0
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'reset',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    ),
                    onPressed:  (){Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return new Dashboard();
                        }));},
                    color: Colors.green,
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