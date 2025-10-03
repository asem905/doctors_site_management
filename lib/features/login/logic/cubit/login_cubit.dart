import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_proj/core/networking/api_result.dart';
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
      success: (data) {
        if (!isClosed) emit(LoginState.success(data));
      },
      failure: (error) {
        if (!isClosed) emit(LoginState.error(error.apiErrorModel.message.toString()));
      },
    );
  }

}