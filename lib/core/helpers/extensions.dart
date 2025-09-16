import 'package:flutter/material.dart';

extension Navigation on BuildContext{
  Future<dynamic> pushNamed(String routeName, {Object? arguments}){
    return Navigator.of(this).pushNamed( routeName, arguments: arguments);
  }
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}){
    return Navigator.of(this).pushReplacementNamed( routeName, arguments: arguments);
  }
  Future<dynamic> pushNamedAndRemoveUntil(MaterialPageRoute route, {Object? arguments,required RoutePredicate predicate}){
    return Navigator.of(this).pushAndRemoveUntil(route, predicate);
  }
  void pop<T extends Object?>([ T? result]){
    return Navigator.of(this).pop(result);
  }

}