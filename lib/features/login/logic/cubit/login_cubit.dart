import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_proj/core/helpers/constants.dart';
import 'package:flutter_complete_proj/core/helpers/extensions.dart';
import 'package:flutter_complete_proj/core/helpers/shared_pref_helper.dart';
import 'package:flutter_complete_proj/core/networking/api_result.dart';
import 'package:flutter_complete_proj/core/networking/dio_factory.dart';
import 'package:flutter_complete_proj/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_proj/features/login/data/repos/login_Repo.dart';
import 'package:flutter_complete_proj/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    emit(const LoginState.loading());
    
    final result = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    
    // CRITICAL: Check if cubit is still open before emitting
    // This prevents the "Cannot emit new states after calling close" error
    if (isClosed) return;
    
    result.when(
      success: (data)async {
        await saveUserToken(data.userData!.token!.toString());
        if (!isClosed) emit(LoginState.success(data));
      },
      failure: (error) {
        if (!isClosed) emit(LoginState.error(error.apiErrorModel.message.toString()));
      },
    );
  }
  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    if(!token.isNullOrEmpty()){
      DioFactory.setTokenAfterLogin(token);
    }
  }

}