// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  void Function()? onTap;
  String text;

  MyButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,child: 
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Container(
    padding: EdgeInsets.all(20),
    decoration: 
    BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.lightBlue),
    child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),),
    
    ),
    ),);
  }
}
