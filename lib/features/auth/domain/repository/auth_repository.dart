import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/auth/domain/enities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository{
  Future<Either<Failure,User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure,User>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  
}