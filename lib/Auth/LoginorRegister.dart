import 'package:flutter/material.dart';
import 'package:social_media_app_last_version_2/Pages/LoginPage.dart';
import 'package:social_media_app_last_version_2/Pages/RegisterPage.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {

  bool IsLogin = true;

  void TogglePages() {

  setState(() {
    
  IsLogin = !IsLogin;

  });

  }

  @override
  Widget build(BuildContext context) {
    
  if (IsLogin) {

  return LoginPage(onTap: TogglePages);

  } else {

  return RegisterPage(onTap: TogglePages);

  }

  }
}