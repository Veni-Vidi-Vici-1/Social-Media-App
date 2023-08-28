// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  String hinttext;
  bool obscureText;
  final Controller;

  MyTextField({
    Key? key,
    required this.Controller,
    required this.hinttext,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24),child: 
    TextField(controller: Controller,
    obscureText: obscureText,
    decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(12)
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(12)
    ),
    fillColor: Colors.white,
    filled: true,
    hintText: hinttext
    ),
    ),);
  }
}
