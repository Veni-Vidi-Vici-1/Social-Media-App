// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {

  bool IsLiked;
  void Function()? onPressed;

  LikeButton({
    Key? key,
    required this.IsLiked,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: 
    Icon(IsLiked ? Icons.favorite : Icons.favorite_border,
    color: IsLiked ? Colors.red : Colors.grey,));
  }
}
