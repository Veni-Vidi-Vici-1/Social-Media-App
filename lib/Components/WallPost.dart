// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:social_media_app_last_version_2/Components/CommentButton.dart';
import 'package:social_media_app_last_version_2/Components/CommentTile.dart';
import 'package:social_media_app_last_version_2/Components/LikeButton.dart';
import 'package:social_media_app_last_version_2/HelperMethods/FormatDate.dart';

class WallPost extends StatefulWidget {

  final String message;
  final String UserEmail;
  final String time;
  final List<String> likes;
  final String postId;

  const WallPost({
    Key? key,
    required this.message,
    required this.UserEmail,
    required this.time,
    required this.likes,
    required this.postId,
  }) : super(key: key);

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {

    final CurrentUser = FirebaseAuth.instance.currentUser!;

    bool IsLiked = false;

    final CommentController = TextEditingController();

    void DeletePost() {

    showDialog(context: context, builder: (context) => AlertDialog(

    backgroundColor: Colors.lightBlue.shade50,
    title: Text("Delete Post"),
    content: Text("Are you sure you want to delete this comment?"),
    actions: [

    TextButton(onPressed: (){

    Navigator.pop(context);

    }, child: Text("Cancel",style: TextStyle(color: Colors.red),)),

    TextButton(onPressed: () async {

    final commentDocs = await FirebaseFirestore.instance.collection("WallMessages").doc(widget.postId).collection("Comments").get();

    for (var doc in commentDocs.docs) {

    await FirebaseFirestore.instance.collection("WallMessages").doc(widget.postId).collection("Comments").doc(doc.id).delete();

    }

    FirebaseFirestore.instance.collection("WallMessages").doc(widget.postId).delete().then((value) => print("Post Deleted")).catchError((onError) => print("Failed to delete post"));

    Navigator.pop(context);

      
    }, child: Text("Delete Post"))

    ],

    ));

    }

    void ToggleLike() {

    setState(() {
      
    IsLiked = !IsLiked;

    });

    DocumentReference postRef = FirebaseFirestore.instance.collection("WallMessages").doc(widget.postId);

    if (IsLiked) {

    postRef.update({
    "Likes":FieldValue.arrayUnion([CurrentUser.email])
    });

    } else {

    postRef.update({
    "Likes":FieldValue.arrayRemove([CurrentUser.email])
    });

    }

    }

    void ShowCommentDialog() {

    
    showDialog(context: context, builder: (context) => AlertDialog(

    backgroundColor: Colors.lightBlue.shade50,
    title: Text("Add Comments",style: TextStyle(color: Colors.black),),
    content: TextField(
    controller: CommentController,
    decoration: InputDecoration(
    hintText: "Enter Comment",
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(12)
    ),
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(12)
    ),
    fillColor: Colors.white,
    filled: true
    ),
    ),
    actions: [

    TextButton(onPressed: (){

    Navigator.pop(context);

    CommentController.clear();
      
    }, child: Text("Cancel",style: TextStyle(color: Colors.red),)),

    TextButton(onPressed: () => AddComment(CommentController.text), child: Text("Post Comment",style: TextStyle(color: Colors.blue),))

    ],
    ));

    }

    void AddComment(String comment) {

    if (CommentController.text.isNotEmpty) {

    FirebaseFirestore.instance.collection("WallMessages").doc(widget.postId).collection("Comments").add({

    "CommentText":comment,
    "CommentedBy":CurrentUser.email,
    "CommentTime":Timestamp.now()

    });

    CommentController.clear();
    Navigator.pop(context);

    }

    }

  @override
  Widget build(BuildContext context) {

    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12)
    ),
    child: Column(children: [
    
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(widget.message,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
    IconButton(onPressed: DeletePost, icon: Icon(Icons.cancel)),],),
    Row(
    children: [
    Text(widget.UserEmail,style: TextStyle(color: Colors.grey.shade500),),
    SizedBox(width: 12,),
    Text(widget.time,style: TextStyle(color: Colors.grey.shade500),)],),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    Column(children: [

    LikeButton(IsLiked: IsLiked, onPressed: ToggleLike),
    Text(widget.likes.length.toString())

    ],),

    Column(children: [

    CommentButton(onPressed: ShowCommentDialog),
    Text(widget.likes.length.toString())

    ],)

    ],),

    SizedBox(height: 12,),

    StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection("WallMessages").doc(widget.postId).collection("Comments").orderBy("CommentTime",descending: false).snapshots(),
    builder: (context,snapshot) {

    if (!snapshot.hasData) {

    return Center(child: CircularProgressIndicator(color: Colors.lightBlue,),);

    }

    return ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: snapshot.data!.docs.map((doc) {

    final commentData = doc.data() as Map<String,dynamic>;

    return CommentTile(commentText: commentData["CommentText"], email: commentData["CommentedBy"], time: formatDate(commentData["CommentTime"]));

    } ).toList(),
    );

    })

    ],),
    
    ),
    );
  }
}
