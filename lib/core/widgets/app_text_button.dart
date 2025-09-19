import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? horizontalPadding;
  final EdgeInsetsGeometry? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String? buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  const AppTextButton({super.key
    , this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    this.textStyle,
    this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed?? (){},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?? 16.r)
        ),
        backgroundColor: backgroundColor?? Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding?.horizontal.w ?? 12.w, vertical: verticalPadding?.vertical.h ?? 14.h),
        fixedSize: Size(buttonWidth?.w ?? double.infinity, buttonHeight ?? 50.h)
      ),
      child: Text(buttonText ?? "", style: textStyle ?? TextStyles.font16WhiteSemiBold,),
    );
  }
}