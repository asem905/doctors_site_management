import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/theming/colors.dart';
import 'package:flutter_complete_proj/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String)? validator;
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.backgroundColor,
    this.isObscureText,
    this.hintStyle,
    this.inputTextStyle,
    this.focusedBorder,
    this.enabledBorder,
    this.contentPadding,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.mainBlue, width: 1.3),
              borderRadius: BorderRadius.circular(16.r),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.lighterGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.r),
        ),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText ?? "",
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? ColorsManager.moreLightGray,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
      validator: (value) {
        return validator!(value!);
      },
    );
  }
}
