import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_proj/core/helpers/spacing.dart';
import 'package:flutter_complete_proj/core/theming/styles.dart';
import 'package:flutter_complete_proj/core/widgets/app_text_button.dart';
import 'package:flutter_complete_proj/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_proj/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_proj/features/login/ui/widgets/dont_have_an_account_text.dart';
import 'package:flutter_complete_proj/features/login/ui/widgets/email_and_password.dart';
import 'package:flutter_complete_proj/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter_complete_proj/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
        padding:EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Welcome Back", style: TextStyles.font24BlueBold),
              verticalSpacing(8),
              Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in.", style: TextStyles.font16WhiteMedium),
              verticalSpacing(36),
              Column(
                children: [
                  EmailAndPassword(),
                  verticalSpacing(24),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text("Forgot Password?", style: TextStyles.font13BlueRegular),
                  ),
                  verticalSpacing(40),
                  AppTextButton(buttonText: "Login", 
                    onPressed:(){
                      if(context.read<LoginCubit>().formKey.currentState!.validate()){
                        context.read<LoginCubit>().emitLoginState();
                      }
                    },
                    textStyle: TextStyles.font16WhiteSemiBold,
                  ),
                  verticalSpacing(16),
                  TermsAndConditionsText(),
                  verticalSpacing(60),
                  DontHaveAnAccountText(),
                  const LoginBlocListener(),
                ],
              )
            ],
          ),
        )
        ))
    );
  }
}