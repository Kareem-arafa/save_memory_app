import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              print('Memories');
              Navigator.pushNamed(context, "memory");
            },
            child: Hero(
              tag: 'mem',
              child: Image(
                image: AssetImage('assets/mem.jpg'),
                color: Color.fromRGBO(103, 106, 112, 0.9),
                colorBlendMode: BlendMode.modulate,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top:( MediaQuery.of(context).size.height/2)-75,
            left: (MediaQuery.of(context).size.width/4)-25,
            child: RotatedBox(
              quarterTurns: -1,
              child: GestureDetector(
                onTap: (){
                  print('memories Text');
                },
                child: Text(
                  "Memory",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),),
          Container(
            width: 2,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    print('Dreams');
                    Navigator.pushNamed(context, "dream");
                  },
                  child: Hero(
                    tag: 'dre',
                    child: Image(
                      image: AssetImage('assets/dream.jpg'),
                      color: Color.fromRGBO(103, 106, 112, 0.9),
                      colorBlendMode: BlendMode.modulate,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top:( MediaQuery.of(context).size.height/2)-60,
                  left: (MediaQuery.of(context).size.width/4)-20,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: GestureDetector(
                      onTap: (){
                        print('Dreams Text');
                      },
                      child: Text(
                        "Dream",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
