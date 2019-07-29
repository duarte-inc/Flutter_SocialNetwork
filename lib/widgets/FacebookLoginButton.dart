import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../functions/login_functions.dart' as loginFunctions;
import '../HelperClasses/DatabaseHelperClass.dart';
import '../pages/home_page.dart';
import '../ErrorHandling/LoginErrorHandling.dart' as loginErrorHandling;

class FacebookLoginButton extends StatelessWidget {
  final DatabaseHelperClass databaseHelperClass = new DatabaseHelperClass();

  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: 250.0,
        height: 50.0,
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                EvaIcons.facebook,
                color: Colors.blue,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "CONTINUE WITH FACEBOOK",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        loginFunctions.LoginFunctions()
            .loginWithFacebook()
            .then((user) => {
          databaseHelperClass
              .saveUserDataToDatabase(user),
        })
            .then((_) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage())))
            .catchError((e) => {
          loginErrorHandling.LoginErrorHandling(context, e.code).handleFacebookError(),
        });
      },
    );
  }
}