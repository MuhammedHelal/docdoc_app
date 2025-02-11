import 'package:flutter/material.dart';
import 'package:flutter_advanced/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderButton extends StatefulWidget {
  const GenderButton({super.key});

  @override
  State<GenderButton> createState() => _GenderDropDownButtonState();
}

class _GenderDropDownButtonState extends State<GenderButton> {
  late final SignupCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SignupCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      decoration: const InputDecoration(hintText: 'Gender'),
      onChanged: (value) {
        setState(() {
          cubit.selectedGender = value!;
        });
      },
      items: [
        const DropdownMenuItem<int>(
          value: 0,
          child: Text('Male'),
        ),
        const DropdownMenuItem<int>(
          value: 1,
          child: Text('Female'),
        ),
      ],
    );
  }
}
