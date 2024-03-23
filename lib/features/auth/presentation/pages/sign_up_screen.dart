import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign Up",
            style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold,),),
            const SizedBox(height: 30,),
            AuthField(
            hintText: "Name",
            controller: nameController,
            ),
            const SizedBox(height: 15,),
            AuthField(
            hintText: "Email",
            controller: emailController,
            ),
            const SizedBox(height: 15,),
            AuthField(
            hintText: "Password",
            controller: passwordController,
            ),
            const SizedBox(height: 20,),
            AuthGradientButton(
              buttonText: "Sign Up",
              onPressed: (){},
            ),
            const SizedBox(height: 20,),
            RichText(text: TextSpan(
              text: 'Don\'t have an account? ',
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                  text: 'Sign Up',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppPallete.gradient2,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ]
            ))
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }
}