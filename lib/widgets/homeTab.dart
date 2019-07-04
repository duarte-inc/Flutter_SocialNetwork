import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import '../database/databaseReferences.dart' as databaseReference;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'writeTab.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List colors = [
    Colors.red,
    Colors.green,
    Colors.brown,
    Colors.blue,
    Colors.deepPurple
  ];

  var containerHeight;
  var boxConstraint;
  bool showFull = false;

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.border_color),
        backgroundColor: Colors.orange,
        onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WriteTab(),
              ),
            ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
//            Flexible(
//              child: FirebaseAnimatedList(
//                  query: databaseReference.DatabaseReferences()
//                      .postDatabaseReference,
//                  defaultChild: Container(
//                    width: MediaQuery.of(context).size.width,
//                    child: Center(
//                      child: CircularProgressIndicator(),
//                    ),
//                  ),
//                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
//                      Animation<double> animation, int index) {
//                    return Container(
//                      padding: EdgeInsets.only(
//                        left: 25.0,
//                        right: 25.0,
//                        top: 20.0,
//                        bottom: 10.0,
//                      ),
//                      child: shortPostBody(snapshot),
//                    );
//                  }),
//            ),
          ],
        ),
      ),
    );
  }

  Widget shortPostBody(DataSnapshot snapshot) {
    containerHeight =
        showFull ? double.infinity : MediaQuery.of(context).size.width - 80;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: containerHeight,
            ),
            child: Text(
              snapshot.value['writeup'],
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 0.1,
                  height: 1.1,
                  fontSize: 18),
              textAlign: TextAlign.left,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
          onTap: () {
            print("tap");
            setState(() {
              showFull = !showFull;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
//              color: Colors.orange,
              child: Text(
                snapshot.value['name'],
                style: TextStyle(
                  color: Colors.green,
                  letterSpacing: 1.0,
                  fontSize: 14.0,
                  height: 2.0,
                ),
              ),
            ),
            Container(
//              color: Colors.red,
              child: Row(
                children: <Widget>[
                  Icon(
                    EvaIcons.arrowCircleDownOutline,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    EvaIcons.arrowCircleUpOutline,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    EvaIcons.share,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Divider(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
