// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfieTile extends StatelessWidget {

  String sectionText;
  String text;
  void Function()? onTap;

  ProfieTile({
    Key? key,
    required this.sectionText,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,child: 
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
      color: Colors.lightBlue.shade50,
      borderRadius: BorderRadius.circular(12)
      ),
      child: Column(children: [
    
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Text(sectionText,style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      IconButton(onPressed: onTap, icon: Icon(Icons.settings,color: Colors.black,))
    
      ],),
    
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12 ),
            child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
      )
    
      ],),
      ),
    ),);
  }
}
