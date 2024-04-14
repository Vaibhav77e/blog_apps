import 'package:blog_app/core/errors/exception.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blog_app/features/auth/domain/enities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;


class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failure, User>> logInWithEmailAndPassword({
    required String email, 
    required String password
    }) async{
        return _getUser(() async=> await authRemoteDataSource.logInWithEmailAndPassword(
                          email: email, 
                          password: password));
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name, 
    required String email, 
    required String password}) async{

  return _getUser(() async=> await authRemoteDataSource.signUpWithEmailAndPassword(
                  name: name, 
                  email: email, 
                  password: password)
        
        ) ;
 
  }


  Future<Either<Failure,User>> _getUser(Future<User> Function() fun)async{
    try{
        final user = await fun();
        
        return right(user);
      } on sb.AuthException catch(e){
        return left(Failure(e.message));
      }
      on ServerExceptions catch(e){
        return left(Failure(e.message));
      }
  } 
  
}