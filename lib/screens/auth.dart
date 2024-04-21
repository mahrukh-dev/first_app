import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/Loginorregister.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/home.dart';

class Authpage extends StatelessWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Homage();
              } else {
                return LoginOrRegisterPage();
              }
            }));
  }
}
