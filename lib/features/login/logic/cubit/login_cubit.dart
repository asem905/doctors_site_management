import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_proj/core/networking/api_result.dart';
import 'package:flutter_complete_proj/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_proj/features/login/data/repos/login_Repo.dart';
import 'package:flutter_complete_proj/features/login/logic/cubit/login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  void emitLoginState(String email, String password) async {
    emit(LoginState.loading());
    final result = await _loginRepo.login(
      LoginRequestBody(email: email, password: password),
    );
    result.when(
      success: (data) => emit(LoginState.success(data)),
      failure: (error) => emit(LoginState.error(error.apiErrorModel.message.toString())),
    );
  }
}
