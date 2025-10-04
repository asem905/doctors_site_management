import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/di/dependency_injection.dart';
import 'package:flutter_complete_proj/core/helpers/constants.dart';
import 'package:flutter_complete_proj/core/helpers/extensions.dart';
import 'package:flutter_complete_proj/core/helpers/shared_pref_helper.dart';
import 'package:flutter_complete_proj/core/routing/app_router.dart';
import 'package:flutter_complete_proj/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
checkIfLoggedInUser ()async{
  String token = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if(!token.isNullOrEmpty()){
    isLoggedInUser = true;
  }else{
    isLoggedInUser = false;
  }
}