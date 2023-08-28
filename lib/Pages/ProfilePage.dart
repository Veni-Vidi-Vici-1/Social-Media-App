import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_last_version_2/Components/ProfileTile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    final Currentuser = FirebaseAuth.instance.currentUser!;

    final userCollection = FirebaseFirestore.instance.collection("Users");

    void editField(String field) async {

    String newValue = "";
    
    await showDialog(context: context, builder: (context) => AlertDialog(

    title: Text("Edit ${field}",style: TextStyle(color: Colors.black),),
    backgroundColor: Colors.lightBlue.shade100,
    actions: [

    TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),

    TextButton(onPressed: (){Navigator.of(context).pop(newValue);}, child: Text("Save"))

    ],
    content: TextField(
    decoration: InputDecoration(
    hintText: "Enter new ${field}",
    
    ),
    autofocus: true,
    style: TextStyle(color: Colors.black),
    onChanged: (value){

    newValue = value;

    },
    ),

    ));

        if (newValue.trim().length > 0) {

        await userCollection.doc(Currentuser.email).update({field:newValue});

        }

    }

    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
    backgroundColor: Colors.black,
    centerTitle: true,
    elevation: 0,
    title: Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text("Profie Page   ",style: TextStyle(color: Colors.lightBlue.shade50),),
    Icon(Icons.person,color: Colors.lightBlue.shade50,)
    ],
    ),),
    body: Column(children: [

    SizedBox(height: 24,),

    SizedBox(height: 24,),
    Row(children: [

    Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Text("My Details"),
    )

    ],),
    SizedBox(height: 24,),
    ProfieTile(sectionText: "User Name", text: Currentuser.email!.split("@")[0].toString(), onTap:() => editField("User Name")),

    SizedBox(height: 24,),
    ProfieTile(sectionText: "Bio", text: "Empty Bio", onTap: (){})

    ],),
    );
  }
}