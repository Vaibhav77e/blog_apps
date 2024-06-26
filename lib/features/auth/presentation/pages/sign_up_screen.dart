import 'package:blog_app/core/commons/widgets/loader.dart';
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/showSnackbar.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';

class SignUpScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => SignUpScreen());
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthFailureState){
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if(state is AuthLoadingState){
            return const Loader();
          }
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AuthField(
                        hintText: "Name",
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthField(
                        hintText: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthField(
                        hintText: "Password",
                        controller: passwordController,
                        isObscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthGradientButton(
                        buttonText: "Sign Up",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  AuthSignUp(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            SignInScreen.route(),
                          );
                        },
                        child: RichText(
                            text: TextSpan(
                                text: 'Already have an account? ',
                                style: Theme.of(context).textTheme.titleMedium,
                                children: [
                              TextSpan(
                                text: 'Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: AppPallete.gradient2,
                                        fontWeight: FontWeight.bold),
                              ),
                            ])),
                      )
                    ],
                  ),
                ),
              ));
        },
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
