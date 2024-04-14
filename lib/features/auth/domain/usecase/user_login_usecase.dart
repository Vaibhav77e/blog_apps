import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../enities/user.dart';
import '../repository/auth_repository.dart';

class UserLogIn implements UseCase<User,UserLogInParams>{
  AuthRepository authRepository;
  UserLogIn(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLogInParams params) async{
    return await authRepository.logInWithEmailAndPassword(email: params.email, password: params.password);
  }
}

class UserLogInParams{
  final String email;
  final String password;

  UserLogInParams({
    required this.email,
    required this.password
  });
}