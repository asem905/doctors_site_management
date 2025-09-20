import 'package:dio/dio.dart';
import 'package:flutter_complete_proj/core/networking/api_service.dart';
import 'package:flutter_complete_proj/core/networking/dio_factory.dart';
import 'package:flutter_complete_proj/features/login/data/repos/login_Repo.dart';
import 'package:flutter_complete_proj/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_proj/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;
Future<void> setupGetIt()async{
  // Register your dependencies here
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignupCubit>(()=> SignupCubit(getIt()));
}