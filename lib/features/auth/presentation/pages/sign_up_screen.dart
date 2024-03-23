import 'package:flutter/material.dart';

import '../widgets/auth_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign Up"),
          AuthField(
          hintText: "Name",
          controller: nameController,
          ),
          AuthField(
          hintText: "Email",
          controller: emailController,
          ),
          AuthField(
          hintText: "Name",
          controller: passwordController,
          ),
        ],
      ),
    );
  }
}