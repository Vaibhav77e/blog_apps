import 'package:blog_app/features/auth/domain/enities/user.dart';
import 'package:blog_app/features/auth/domain/usecase/user_signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';


/*
remember that usermodel is only for data layer we will user from entity for domain and presentation
*/

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp
  }) : _userSignUp = userSignUp,// initalizers list
   super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async{
      // _userSignUp.call(UserSignUpParams(name: name, email: email, password: password)) is same as _userSignUp(UserSignUpParams(name: name, email: email, password: password))
      // because call is special we can call directly instance(_userSignUp) and the pass params
      final res = await _userSignUp(UserSignUpParams(name: event.name, 
      email: event.email, 
      password: event.password));

      res.fold((failure) => AuthFailureState(failure.message), (user) => AuthSuccessState(user));
    });
  }
}
