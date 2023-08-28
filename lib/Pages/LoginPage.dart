// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:social_media_app_last_version_2/Components/MyButton.dart';
import 'package:social_media_app_last_version_2/Components/MyTextField.dart';

class LoginPage extends StatelessWidget {

  void Function()? onTap;

  LoginPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final EmailController = TextEditingController();
    final PasswordController = TextEditingController();

    void SendError(String error) {

    showDialog(context: context, builder: (context) => AlertDialog(

    backgroundColor: Colors.lightBlue.shade300,
    title: Text(error),

    ));
    }

    void SignIn() async {

    try {

    await FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailController.text, password: PasswordController.text);

    } on FirebaseAuthException catch (e) {

    SendError(e.code);

    }
    }

    return Scaffold(
    backgroundColor: Colors.grey.shade200,
    body: SingleChildScrollView(child: SafeArea(child: Column(children: [

    SizedBox(height: 86,),
    Center(child: Icon(Icons.message,color: Colors.lightBlue,size: 86,),),
    SizedBox(height: 42,),
    MyTextField(Controller: EmailController, hinttext: "Email", obscureText: false),
    SizedBox(height: 36,),
    MyTextField(Controller: PasswordController, hinttext: "Password", obscureText: true),
    SizedBox(height: 42,),
    MyButton(onTap: SignIn, text: "Sign In"),
    SizedBox(height: 36,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    Text("Not a member?   "),
    GestureDetector(onTap: onTap,child: Text("Register",style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),)

    ],)

    ],)),),

    );
  }
}