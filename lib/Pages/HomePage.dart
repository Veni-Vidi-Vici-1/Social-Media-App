import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_last_version_2/Components/MyDrawer.dart';
import 'package:social_media_app_last_version_2/Components/MyTextField.dart';
import 'package:social_media_app_last_version_2/Components/WallPost.dart';
import 'package:social_media_app_last_version_2/HelperMethods/FormatDate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final MessageController = TextEditingController();

    final firebaseauth = FirebaseAuth.instance.currentUser!;

    void SendMessage() {

    if (MessageController.text.isNotEmpty) {

    FirebaseFirestore.instance.collection("WallMessages").add({
    
    "UserEmail":firebaseauth.email,
    "Message":MessageController.text,
    "Timestamp":Timestamp.now(),
    "Likes":[]

    });
    MessageController.clear();
    }

    }

    return Scaffold(
    drawer: MyDrawer(),
    backgroundColor: Colors.grey.shade200,
    
    appBar: AppBar(
    iconTheme: IconThemeData(color: Colors.lightBlue.shade50),
    backgroundColor: Colors.black,
    elevation: 0,
    title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("The Wall    ",style: TextStyle(color: Colors.lightBlue.shade50,fontWeight: FontWeight.bold,fontSize: 20),),
    Icon(Icons.message,color: Colors.lightBlue.shade50,size: 29,)
    ],
    ),
    centerTitle: true,
    ),
    body: Column(
    children: [

    Expanded(child: StreamBuilder(
    stream: FirebaseFirestore.instance.collection("WallMessages").orderBy("Timestamp",descending: false).snapshots(),
    builder: ((context, snapshot) {
      
    if (!snapshot.hasData) {

    return Center(child: CircularProgressIndicator(color: Colors.lightBlue,),);

    } else {

    return ListView.builder(
    itemCount: snapshot.data!.docs.length,
    itemBuilder: (context,index) {

    final post = snapshot.data!.docs[index];

    return WallPost(message: post["Message"], UserEmail: post["UserEmail"], 
    time: formatDate(post["Timestamp"]), 
    postId: post.id,
    likes: List<String>.from(post["Likes"] ?? []));

    });

    }

    }))),

    Row(children: [

    Expanded(child: MyTextField(Controller: MessageController, hinttext: "Send Message", obscureText: false)),
    IconButton(onPressed: SendMessage, icon: Icon(Icons.send,color: Colors.lightBlue,))

    ],),

    SizedBox(height: 24,),

    Text(firebaseauth.email.toString()),

    SizedBox(height: 12,),

    ],),
    );
  }
}