import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_proj/core/helpers/spacing.dart';
import 'package:flutter_complete_proj/core/theming/colors.dart';
import 'package:flutter_complete_proj/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  const PasswordValidations({super.key, required this.hasLowercase, required this.hasUppercase, required this.hasNumber, required this.hasSpecialCharacters, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least 1 Lowercase  letter", hasMinLength),
        verticalSpacing(2),
        buildValidationRow("At least 1 Uppercase letter", hasUppercase),
        verticalSpacing(2),
        buildValidationRow("At least 1 Number", hasNumber),
        verticalSpacing(2),
        buildValidationRow("At least 1 Special Character", hasSpecialCharacters),
        verticalSpacing(2),
        buildValidationRow("Minimum 8 characters", hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String s, bool isValid) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 6,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpacing(6),
        Text(s,style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: isValid? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: isValid? ColorsManager.gray : ColorsManager.darkBlue
        ),),
      ],
    );
  }
}