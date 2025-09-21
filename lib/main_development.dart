import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/di/dependency_injection.dart';
import 'package:flutter_complete_proj/core/routing/app_router.dart';
import 'package:flutter_complete_proj/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}