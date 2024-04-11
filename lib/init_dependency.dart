import 'package:blog_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/secrets/app_secrets.dart';

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
  serviceLocator.registerFactory(() => AuthRemoteDataSourceImpl(serviceLocator()));
}