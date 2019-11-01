import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool passwordState=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back.jpg'), fit: BoxFit.cover),
              )),
          Container(
            color: Color.fromRGBO(155, 147, 154, .8),
          ),
          SingleChildScrollView(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               SizedBox(height: 150,),
                ScaleAnimatedTextKit(
                  duration: Duration(milliseconds: 2000),
                  isRepeatingAnimation: false ,
                    text: [
                      "Memorito",
                    ],
                    textStyle: TextStyle(
                        fontSize: 40.0,
                        fontFamily: "Calibri",
                      color: Colors.blue

                    ),
                    textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                ),
                new Form(
                    child: new Theme(
                        data: new ThemeData(
                            brightness: Brightness.light,
                            primarySwatch: Colors.blue,
                            //   primaryColor: Colors.blue,
                            hintColor: Colors.white,
                            inputDecorationTheme: new InputDecorationTheme(
                                labelStyle: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ))),
                        child: new Container(
                            padding: const EdgeInsets.all(40.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //email
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                                  child: new TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: new InputDecoration(

                                        border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(30.0),
                                            ),
                                            borderSide: BorderSide(
                                              width: 0,
                                            )),
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 14.0, horizontal: 20.0),

                                        filled: true,
                                        hintStyle: new TextStyle(
                                            color: Colors.white, fontSize: 18),
                                        hintText: "E-mail",

                                        fillColor:
                                        Color.fromRGBO(176, 170, 176, .75)),
                                  ),
                                ),
                                //password
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                                  child: new TextField(
                                    obscureText: passwordState,
                                    style: TextStyle(color: Colors.white),
                                    decoration: new InputDecoration(
                                      suffixIcon:  IconButton(
                                        icon: Icon(
                                            passwordState? Icons.visibility_off:Icons.visibility,
                                            color: passwordState?Color.fromRGBO(105, 105, 105, 1) : Colors.blue,size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            passwordState=!passwordState;
                                          });
                                        },
                                      ),

                                        border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(30.0),
                                            ),
                                            borderSide: BorderSide(
                                              width: 0,
                                            )),
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 20.0),
                                        filled: true,
                                        hintStyle: new TextStyle(
                                            color: Colors.white, fontSize: 18),
                                        hintText: "Password",
                                        fillColor:
                                        Color.fromRGBO(176, 170, 176, .75)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 40.0)),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, "profile");
                                    },
                                    padding: EdgeInsets.all(12),
                                    color: Theme.of(context).primaryColor,
                                    child: Text('SIGN IN',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                FlatButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Create an acount ",style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'signup');
                                  },
                                )
                              ],
                            ))))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
