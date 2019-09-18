import 'package:flutter/material.dart';
import 'package:redux_example/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/routes/namedRoutes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = "The Project Quote";

  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
          title: title,
          theme: ThemeData(
            fontFamily: 'OpenSans', 
          ),
          home: Scaffold(
            backgroundColor: Colors.black,
            resizeToAvoidBottomPadding: false,
            body: Routes(),
          ),
        ));
  }
}
