import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extentions.dart';
import 'package:flutter_advanced/core/routing/routes_strings.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyles.black14Normal,
        ),
        TextButton(
          // style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            context.pushNamed(RoutesStrings.login);
          },
          child: Text(
            'Login',
            style: TextStyles.primary14Normal,
          ),
        ),
      ],
    );
  }
}
