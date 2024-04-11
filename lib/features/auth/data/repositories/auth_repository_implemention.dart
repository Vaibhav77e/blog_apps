import 'package:blog_app/core/errors/exception.dart';
import 'package:blog_app/core/errors/failure.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';


class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failure, String>> logInWithEmailAndPassword({
    required String email, 
    required String password
    }) {
    // TODO: implement logInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String name, 
    required String email, 
    required String password}) async{
      try{
        final userId = await authRemoteDataSource.signUpWithEmailAndPassword(
                          name: name, 
                          email: email, 
                          password: password);
        
        return right(userId);
      } on ServerExceptions catch(e){
        return left(Failure(e.message));
      }
  }
  
}