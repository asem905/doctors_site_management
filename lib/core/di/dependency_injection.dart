import 'package:dio/dio.dart';
import 'package:flutter_complete_proj/core/networking/api_service.dart';
import 'package:flutter_complete_proj/core/networking/dio_factory.dart';
import 'package:flutter_complete_proj/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_proj/features/home/data/repos/home_repo.dart';
import 'package:flutter_complete_proj/features/login/data/repos/login_Repo.dart';
import 'package:flutter_complete_proj/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_proj/features/signup/data/repos/sign_up_repo.dart';
import 'package:flutter_complete_proj/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;
Future<void> setupGetIt()async{
  // Register your dependencies here
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(()=> SignupCubit(getIt()));
  //Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  //no need for this line because i am already making acubit each time i need it so i can just in router pass new instance of it each time i need
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}