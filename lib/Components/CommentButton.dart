// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommentButton extends StatelessWidget {

  void Function()? onPressed;

  CommentButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(Icons.message,color: Colors.lightBlue.shade200,));
  }
}
