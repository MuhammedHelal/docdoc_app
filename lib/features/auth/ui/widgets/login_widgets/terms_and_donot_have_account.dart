import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extentions.dart';
import 'package:flutter_advanced/core/routing/routes_strings.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyles.black14Normal,
        ),
        TextButton(
          // style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            context.pushNamed(RoutesStrings.signup);
          },
          child: Text(
            'Sign up',
            style: TextStyles.primary14Normal,
          ),
        ),
      ],
    );
  }
}
