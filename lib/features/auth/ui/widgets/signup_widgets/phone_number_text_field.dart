import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/border_styles.dart';
import 'package:flutter_advanced/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// TODO : Complete the ui and refactor
class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({super.key});

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  late final SignupCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<SignupCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      autovalidateMode: AutovalidateMode.onUnfocus,
      validator: (p0) {
        bool phoneIsValid = p0?.isValidNumber() ?? false;
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        focusedBorder: BorderStyles.greenOutlinedInputBorder,
        border: OutlineInputBorder(),
      ),
      initialCountryCode: 'EG',
      onChanged: (phone) {
        _cubit.phone = (phone.completeNumber);
      },
    );
  }
}
