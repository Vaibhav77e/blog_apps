import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';

class SignInScreen extends StatefulWidget {
   static route() => MaterialPageRoute(
                  builder: (context)=>SignInScreen()
                );
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding : const EdgeInsets.symmetric(horizontal: 16),
        child:Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign In",
            style: TextStyle(fontSize: 50,fontWeight:FontWeight.bold,),),
            const SizedBox(height: 30,),
            AuthField(
            hintText: "Email",
            controller: emailController,
            ),
            const SizedBox(height: 15,),
            AuthField(
            hintText: "Password",
            controller: passwordController,
            isObscureText: true,
            ),
            const SizedBox(height: 20,),
            AuthGradientButton(
              buttonText: "Sign In",
              onPressed: (){
              
              },
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,SignUpScreen.route(),
                );
              },
              child: RichText(text: TextSpan(
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
              )),
            )
          ],
        ),
      )
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }
}