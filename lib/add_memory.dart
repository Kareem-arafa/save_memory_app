import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddMemory extends StatefulWidget {
  @override
  _AddMemoryState createState() => _AddMemoryState();
}

class _AddMemoryState extends State<AddMemory> {
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

  //pick images
  List<Asset> images = List<Asset>();

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
      );
    } on Exception catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    setState(() {
      images = resultList;
    });
  }

  Widget buildGridView() {
    return Container(
      height: 350,
      child: GridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.all(5.0),
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return Padding(
            padding: EdgeInsets.all(2.0),
            child: AssetThumb(
              asset: asset,
              width: 80,
              height: 80,
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: 'mem',
            child: Image(
              image: AssetImage('assets/mem.jpg'),
              color: Color.fromRGBO(103, 106, 112, 0.9),
              colorBlendMode: BlendMode.modulate,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                            'Add Memory',
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
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      color: Colors.lightBlue,
                      onPressed: () {
                        loadAssets();
                      },
                      child: Text(
                        'Load',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                images.isEmpty
                    ? Container(
                  height: 100,
                  child: Center(
                    child: new Text(
                      'no data to show',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                )
                    : buildGridView(),
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
