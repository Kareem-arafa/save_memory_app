import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signUp_page.dart';
import 'home.dart';
import 'profile.dart';
import 'add_screen.dart';
import 'add_memory.dart';
import 'add_dream.dart';
import 'show_data.dart';
import 'all_memory.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.blue,),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        'signup': (BuildContext context) => new SignupPage(),
        'signin': (BuildContext context) => new LoginPage(),
        'home': (BuildContext context) => new HomePage(),
        'profile': (BuildContext context) => new Profile(),
        'add': (BuildContext context) => new AddScreen(),
        'memory': (BuildContext context) => new AddMemory(),
        'dream': (BuildContext context) => new AddDream(),
        'allmemeory': (BuildContext context) => new AllMemories(),
      }
    );
  }
}
