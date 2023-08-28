import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_last_version_2/Auth/LoginorRegister.dart';
import 'package:social_media_app_last_version_2/Pages/HomePage.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context,snapshot) {

    if (snapshot.hasData) {

    return HomePage();

    } else {

    return LoginorRegister();

    }

    }),

    );
  }
}