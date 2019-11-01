import 'package:flutter/material.dart';
import 'show_data.dart';

import 'items.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  child: Image.network("https://i.pravatar.cc/900",
                      color: Color.fromRGBO(103, 106, 112, 0.8),
                      colorBlendMode: BlendMode.modulate),
                  clipper: new MyClipper(),
                ),
                Positioned(
                    top: 100,
                    left: (MediaQuery.of(context).size.width / 2 - 75.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Kareem arafa",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Kareem ",
                          style: TextStyle(
                              color: Colors.orangeAccent.withOpacity(0.7),
                              fontSize: 25,
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            dialig(context);
                          },
                          child: Hero(
                            tag: 'prof',
                            child: Container(
                              height: 150.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(75.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        'https://i.pravatar.cc/900',
                                      ),
                                      fit: BoxFit.cover)),
                              // child: Image.network("https://i.pravatar.cc/700"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )),
                Positioned(
                  top: 390,
                  left: 80,
                  child: Text(
                    "kareem.arafa1515@gmail.com",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            //Memories title
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Memories',
                    style: TextStyle(
                        fontFamily: 'Calibri',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: RaisedButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                           Navigator.pushNamed(context, "allmemeory");
                        },
                        color: Colors.lightBlue,
                        child: Text('see all',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //memories body
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 5.0),
              child: Container(
                height: 140.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    model('https://i.pravatar.cc/800', context, 0),
                    model('https://i.pravatar.cc/600', context, 1),
                    model('https://i.pravatar.cc/500', context, 2),
                    model('https://i.pravatar.cc/400', context, 3),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            //dreams title
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Dreams',
                    style: TextStyle(
                        fontFamily: 'Calibri',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: RaisedButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, "profile");
                        },
                        color: Colors.lightBlue,
                        child: Text('see all',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //dreams body
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 5.0),
              child: Container(
                height: 140.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    model('https://i.pravatar.cc/800', context, 4),
                    model('https://i.pravatar.cc/600', context, 5),
                    model('https://i.pravatar.cc/500', context, 6),
                    model('https://i.pravatar.cc/400', context, 7),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add');
        },
        elevation: 8,
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<void> dialig(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Hero(
          tag: 'prof',
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            contentPadding: EdgeInsets.all(0.0),
            content: Container(
                height: 350,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://i.pravatar.cc/900',
                      ),
                      fit: BoxFit.fill,
                    ))),
          ),
        );
      });
}
/*Widget showDialog(){
  return AlertDialog(
    content: Image(image: NetworkImage('https://i.pravatar.cc/900'),fit: BoxFit.cover,),
    Image(image: NetworkImage('https://i.pravatar.cc/900',),fit: BoxFit.fill,),
  );
}*/

Widget model(String imgPath, BuildContext context, int index) {
  return Stack(
    fit: StackFit.passthrough,
    children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GalleryPhotoViewWrapper(
                  galleryItems: galleryItems,
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  initialIndex: index,
                ),
              ));
        },
        child: Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: Hero(
            tag: galleryItems[index].id,
            child: Container(
              height: 100.0,
              width: 150.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: NetworkImage(imgPath), fit: BoxFit.cover)),
            ),
          ),
        ),
      ),
      Positioned(
        top: 100,
        child: Container(
          height: 40,
          width: 150,
          child: Center(
            child: Text(
              'Title',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              color: Color.fromRGBO(103, 106, 112, 0.9),
              backgroundBlendMode: BlendMode.modulate,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0))),
        ),
      )
    ],
  );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width / 2, (size.height / 4) * 3);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
