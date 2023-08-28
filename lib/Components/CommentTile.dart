// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommentTile extends StatelessWidget {

  String commentText;
  String email;
  String time;

    CommentTile({
    Key? key,
    required this.commentText,
    required this.email,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
    color: Colors.lightBlue.shade50,
    borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(bottom: 10),
    child: Column(children: [

    Text(commentText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
    SizedBox(height: 12,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    Text(email,style: TextStyle(color: Colors.grey.shade600),),
    SizedBox(width: 12,),
    Text(time,style: TextStyle(color: Colors.grey.shade600),),
    ],)

    ],),

    );
  }
}
