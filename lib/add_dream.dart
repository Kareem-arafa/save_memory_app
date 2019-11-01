import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddDream extends StatefulWidget {
  @override
  _AddDreamState createState() => _AddDreamState();
}

class _AddDreamState extends State<AddDream> {

  DateTime _date = new DateTime.now();
  //picked Date Func
  Future<Null> _selectDate(BuildContext contex) async {
    final DateTime picked = await showDatePicker(
        context: contex,
        initialDate: _date,
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2100));
    if (picked != _date && picked != null) {
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: 'dre',
            child: Image(
              image: AssetImage('assets/dream.jpg'),
              color: Color.fromRGBO(103, 106, 112, 0.9),
              colorBlendMode: BlendMode.modulate,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //app bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 8.0),
                  child: Container(
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                          Text(
                            'Add Dream',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(176, 170, 176, .5),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                //title
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                            )),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        filled: true,
                        labelStyle:
                            new TextStyle(color: Colors.white, fontSize: 20),
                        labelText: "Title",
                        fillColor: Color.fromRGBO(176, 170, 176, .2)),
                  ),
                ),
                //date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${_date.day} / ${_date.month} / ${_date.year}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 35,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: new RawMaterialButton(
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                    child: new Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 18.0,
                                    ),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    elevation: 7.0,
                                    splashColor: Colors.lightBlueAccent,
                                    fillColor: Colors.lightBlue)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //dream
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0,
                            )),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        filled: true,
                        labelStyle:
                        new TextStyle(color: Colors.white, fontSize: 20),
                        labelText: "Your Dream",
                        fillColor: Color.fromRGBO(176, 170, 176, .2)),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  color: Colors.lightBlue,
                  onPressed: () {

                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
