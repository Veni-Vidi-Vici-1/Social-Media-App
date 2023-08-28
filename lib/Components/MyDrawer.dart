import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_last_version_2/Components/DrawerTile.dart';
import 'package:social_media_app_last_version_2/Pages/ProfilePage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
  return Drawer(

  backgroundColor: Colors.lightBlue.shade50,

  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

  Column(children: [

  DrawerHeader(child: Icon(Icons.person,size: 86,color: Colors.black,)),

  SizedBox(height: 42,),

  DrawerTile(text: "H O M E", icon: Icons.home,onTap: () {

  Navigator.pop(context);

  },),

  DrawerTile(text: "P R O F I L E", icon: Icons.person, onTap: (){

  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));

  }),

  ],),

  Padding(
    padding: const EdgeInsets.only(bottom: 24),
    child: DrawerTile(text: "S I G N O U T ", icon: Icons.logout, onTap: (){

    FirebaseAuth.instance.signOut();

    }),
  )

  ],),

    );
  }
}