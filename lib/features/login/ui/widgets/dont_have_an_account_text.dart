import 'package:flutter/widgets.dart';
import 'package:flutter_complete_proj/core/theming/styles.dart';

class DontHaveAnAccountText extends StatelessWidget {
  const DontHaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
      children:[
        TextSpan(text: "Don't have an Account? ",style: TextStyles.font13DarkBlueRegular,),
        TextSpan(text: "Sign Up", style: TextStyles.font13BlueSemiBold),
      ]
    ));
  }
}