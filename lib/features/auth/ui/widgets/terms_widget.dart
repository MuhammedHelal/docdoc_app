import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging in, you agree to our ',
            style: TextStyles.grey14Normal,
          ),
          TextSpan(
            text: 'Terms of Service',
            style: TextStyles.black14Normal,
          ),
          TextSpan(
            text: ' and ',
            style: TextStyles.grey14Normal,
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyles.black14Normal,
          ),
        ],
      ),
    );
  }
}
