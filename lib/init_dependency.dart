import 'package:blog_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blog_app/features/auth/domain/usecase/user_signup_usecase.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/app_secrets.dart';
import 'features/auth/data/repositories/auth_repository_implemention.dart';
import 'features/auth/domain/repository/auth_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependenices()async{
  _initAuth();
    final supabase = await Supabase.initialize(
    url:AppSecrets.superbaseUrl ,
    anonKey:AppSecrets.annonApiKey);

    // creates instance or objects only once through out the app lifecycle
    serviceLocator.registerSingleton(()=>supabase.client);
}


void _initAuth(){
  // creates objects whenever there is demand
  serviceLocator.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(serviceLocator()));

  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));

  serviceLocator.registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator()));
}