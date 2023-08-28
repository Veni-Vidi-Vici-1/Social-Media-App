// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  String text;
  IconData icon;
  void Function()? onTap;

  DrawerTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
      onTap: onTap,
      leading: Icon(icon,color: Colors.black,),
    
      title: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
      
    
      ),
    );
  }
}
