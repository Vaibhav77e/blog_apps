import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/auth/domain/enities/user.dart';
import 'package:blog_app/features/auth/domain/usecase/user_signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/user_login_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';


/*
remember that usermodel is only for data layer we will user from entity for domain and presentation
*/

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogIn _userLogIn;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogIn userLogIn
  }) : _userSignUp = userSignUp,// initalizers list
        _userLogIn = userLogIn,
   super(AuthInitial()) {
    on<AuthSignUp>(_authUserSignUp);
    on<AuthLogIn>(_authUserLogIn);
  }

  void _authUserSignUp(AuthEvent event,Emitter emit){
    (event, emit) async{
      emit(AuthLoadingState());
      // _userSignUp.call(UserSignUpParams(name: name, email: email, password: password)) is same as _userSignUp(UserSignUpParams(name: name, email: email, password: password))
      // because call is special we can call directly instance(_userSignUp) and the pass params
      final res = await _userSignUp(UserSignUpParams(name: event.name, 
      email: event.email, 
      password: event.password));

      res.fold((failure) => AuthFailureState(failure.message), (user) => AuthSuccessState(user));
    };
  }

  void _authUserLogIn(AuthEvent event,Emitter emitter){
    (event,emit)async{
      emit(AuthLoadingState());

      final res = await _userLogIn(UserLogInParams(email: event.email, password: event.password));

      print('Result : $res');

      res.fold((l) => Failure(l.message), (r) => AuthSuccessState(r));
    };
  }
  
}
