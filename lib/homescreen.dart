import 'package:flutter/material.dart';
import 'adddevices.dart';
import 'app.dart';
import 'state_widget.dart';
import 'login.dart';
import 'auth.dart';

void main(){
  StateWidget stateWidget = new StateWidget(child:new MyApp());
  runApp(stateWidget);
}

class Google extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GoogleState();
}

class GoogleState extends State<Google> {
  StateModel appState;

  Widget _buildStories({Widget body}) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Signin'),
      ),
      body: Container(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    padding: EdgeInsets.all(20.0),
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(appState.user.photoUrl.toString()),
                      ),
                    )),

                new Text(
                  'Hello, ' '${appState.user.displayName}' '!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
        new Container(
      child: new RaisedButton(
      child: new Text(
        'Continue',
        style: new TextStyle(
          color: Colors.white,
        ),textAlign: TextAlign.center,
      ),
      onPressed: (){

          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context)
              {
                return new Adddevices();
              }
          )
          );
      },
      color: Colors.green,
      padding: EdgeInsets.fromLTRB(50, 15, 50, 15),

    ),
    margin: new EdgeInsets.only(
    top: 30.0
    ),
    ),
              ],
            )),
      ),
    );
  }

  Widget _buildContent() {
    if (appState.isLoading) {
      return _buildLoadingIndicator();
    } else if (!appState.isLoading && appState.user == null) {
     return new LoginScreen();
    } else {
      return _buildStories();
    }
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build the content depending on the state:
    appState = StateWidget.of(context).state;
    return _buildContent();
  }
}