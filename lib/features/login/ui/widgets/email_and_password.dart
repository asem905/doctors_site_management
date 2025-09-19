import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_proj/core/helpers/app_Regex.dart';
import 'package:flutter_complete_proj/core/helpers/spacing.dart';
import 'package:flutter_complete_proj/core/widgets/app_text_form_field.dart';
import 'package:flutter_complete_proj/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_proj/features/login/ui/widgets/password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var hasLowercase = false;
  var hasUppercase = false;
  var hasNumber = false;
  var hasSpecialCharacters = false;
  var hasMinLength = false;
  @override
  void initState() {
    // TODO: implement initState
    passwordController = context.read<LoginCubit>().passwordController;
    emailController = context.read<LoginCubit>().emailController;
    setUpPasswordControllerListener();
    super.initState();
  }
  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      final password = passwordController.text;
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(password);
        hasUppercase = AppRegex.hasUpperCase(password);
        hasNumber = AppRegex.hasNumber(password); 
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(password);
        hasMinLength = AppRegex.hasMinLength(password);
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(hintText: 'Email', controller: emailController,
           validator: (value) {
            // Add your email validation logic here using regex
            if (value == null || value.isEmpty || AppRegex.isEmailValid(value)) {
              return 'Please enter your email';
            }
           }
           ),
          verticalSpacing(18),
          AppTextFormField(
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
            ),
            controller: passwordController,
             validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              String pattern =
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
              RegExp regex = RegExp(pattern);
              if (!regex.hasMatch(value)) {
                return 'Password must contain at least one lowercase letter, one uppercase letter, one digit, and one special character';
              }
              return null;
             },
          ),
          verticalSpacing(24),
          PasswordValidations(
            hasLowercase: hasLowercase,
            hasUppercase: hasUppercase,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
