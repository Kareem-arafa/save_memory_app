import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'validate.dart';


class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {
  bool passwordState=true;
  bool _autoValidate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _fullName = new TextEditingController();
  final TextEditingController _name = new TextEditingController();

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
                SizedBox(height: 100,),
                ScaleAnimatedTextKit(
                    duration: Duration(milliseconds:2000),
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
                  key: _formKey,
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
                                //name
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                                  child: new TextFormField(
                                    controller: _fullName,
                                    validator: Validator.validateName,
                                    style: TextStyle(color: Colors.white),
                                    decoration: new InputDecoration(
                                        border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(30.0),
                                            ),
                                            borderSide: BorderSide(
                                              width: 0,
                                              // style: BorderStyle.none,
                                              //  color: Colors.grey,

                                            )),
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 14.0, horizontal: 20.0),
                                        filled: true,
                                        hintStyle: new TextStyle(
                                          //  backgroundColor: Colors.white,
                                            color: Colors.white,
                                            fontSize: 18),
                                        hintText: "Full name",
                                        fillColor:
                                        Color.fromRGBO(176, 170, 176, .75)),
                                  ),
                                ),
                                //user name
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                                  child: new TextFormField(
                                    validator: Validator.validateName,
                                    controller: _name,
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
                                        hintText: "User name",
                                        fillColor:
                                        Color.fromRGBO(176, 170, 176, .75)),
                                  ),
                                ),
                                //email
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                                  child: new TextFormField(
                                    validator: Validator.validateEmail,
                                    controller: _email,
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
                                  child: new TextFormField(
                                    controller: _password,
                                    validator: Validator.validatePassword,
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
                                //Sign up button
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        SystemChannels.textInput
                                            .invokeMethod('TextInput.hide');
                                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                                            email: _email.text,
                                            password: _password.text)
                                            .then((signedInUser){
                                          Navigator.pushNamed(context, "profile");
                                        });
                                      } else {
                                        setState(() {
                                          _autoValidate = true;
                                        });
                                      }
                                    },
                                    padding: EdgeInsets.all(12),
                                    color: Theme.of(context).primaryColor,
                                    child: Text('SIGN UP',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                                // sign in lable
                                FlatButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Have an Account?',style: TextStyle(color: Colors.white),),
                                      Text(' Sign In.',style: TextStyle(color: Colors.blue,fontSize: 16),),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'signin');
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
