import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/helpers/extensions.dart';
import 'package:flutter_complete_proj/core/routing/routes.dart';
import 'package:flutter_complete_proj/core/theming/colors.dart';
import 'package:flutter_complete_proj/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      context.pushNamed(Routes.loginScreen);
    },
     style: TextButton.styleFrom(
      backgroundColor: ColorsManager.mainBlue,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: Size(double.infinity, 52.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r)
      )
     ),
     child:Text("Get Started",style: TextStyles.font16WhiteMedium,) ,
    );
  }
}