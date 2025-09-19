import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/di/dependency_injection.dart';
import 'package:flutter_complete_proj/core/routing/app_router.dart';
import 'package:flutter_complete_proj/doc_app.dart';

void main() {
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
