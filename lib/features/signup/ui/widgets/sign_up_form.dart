// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_proj/core/helpers/app_regex.dart';
import 'package:flutter_complete_proj/features/signup/logic/cubit/sign_up_cubit.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../login/ui/widgets/password_validations.dart';

class SignupForm extends StatefulWidget {
  final SignupCubit signupCubit;
  const SignupForm({super.key, required this.signupCubit});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  // Store the cubit instance once
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // Get the cubit instance once and store it
    passwordController = widget.signupCubit.passwordController;
    setupPasswordControllerListener();
    
    // Debug: Print controller hash codes to verify they're the same instances
    debugControllerInstances();
  }

  void debugControllerInstances() {
    print('=== Controller Hash Codes ===');
    print('Name Controller: ${widget.signupCubit.nameController.hashCode}');
    print('Email Controller: ${widget.signupCubit.emailController.hashCode}');
    print('Phone Controller: ${widget.signupCubit.phoneController.hashCode}');
    print('Password Controller: ${widget.signupCubit.passwordController.hashCode}');
    print('Password Confirmation Controller: ${widget.signupCubit.passwordConfirmationController.hashCode}');
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      key: widget.signupCubit.formKey, // Use stored instance
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null; // Add return null for valid cases
            },
            controller: widget.signupCubit.nameController, // Use stored instance
          ),
          verticalSpacing(18),
          AppTextFormField(
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
              return null; // Add return null for valid cases
            },
            controller: widget.signupCubit.phoneController, // Use stored instance
          ),
          verticalSpacing(18),
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null; // Add return null for valid cases
            },
            controller: widget.signupCubit.emailController, // Use stored instance
          ),
          verticalSpacing(18),
          AppTextFormField(
            controller: widget.signupCubit.passwordController, // Use stored instance
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null; // Add return null for valid cases
            },
          ),
          verticalSpacing(18),
          AppTextFormField(
            controller: widget.signupCubit.passwordConfirmationController, // Use stored instance
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              
              return null; // Add return null for valid cases
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

  @override
  void dispose() {
    // Don't dispose controllers here since they belong to the cubit
    super.dispose();
  }
}