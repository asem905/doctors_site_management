// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/helpers/app_regex.dart';
import 'package:flutter_complete_proj/features/login/logic/cubit/login_cubit.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import 'password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  final LoginCubit loginCubit;
  const EmailAndPassword({super.key, required this.loginCubit});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  bool _listenerAttached = false;

  @override
  void initState() {
    super.initState();
    passwordController = widget.loginCubit.passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    // Only add listener if not already attached and controller is not disposed
    if (!_listenerAttached) {
      try {
        passwordController.addListener(_onPasswordChanged);
        _listenerAttached = true;
      } catch (e) {
        // Controller might be disposed, ignore
        debugPrint('Failed to add listener: $e');
      }
    }
  }

  void _onPasswordChanged() {
    // Check if widget is still mounted before calling setState
    if (!mounted) return;
    
    setState(() {
      hasLowercase = AppRegex.hasLowerCase(passwordController.text);
      hasUppercase = AppRegex.hasUpperCase(passwordController.text);
      hasSpecialCharacters =
          AppRegex.hasSpecialCharacter(passwordController.text);
      hasNumber = AppRegex.hasNumber(passwordController.text);
      hasMinLength = AppRegex.hasMinLength(passwordController.text);
    });
  }

  @override
  void dispose() {
    // Only remove listener if it was successfully attached
    if (_listenerAttached) {
      try {
        passwordController.removeListener(_onPasswordChanged);
        _listenerAttached = false;
      } catch (e) {
        // Controller might already be disposed, ignore
        debugPrint('Failed to remove listener: $e');
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.loginCubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            controller: widget.loginCubit.emailController,
          ),
          verticalSpacing(18),
          AppTextFormField(
            controller: widget.loginCubit.passwordController,
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
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpacing(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
