import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extentions.dart';
import 'package:flutter_advanced/core/routing/routes_strings.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/features/auth/logic/signup_cubit/signup_cubit.dart';
import 'package:flutter_advanced/features/auth/logic/signup_cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      child: const SizedBox.shrink(),
      listener: (BuildContext context, SignupState state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (_) => Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: AppColors.primary,
                size: 150,
              ),
            ),
          );
        }, success: (data) {
          context.pop();

          context.pushReplacementNamed(RoutesStrings.home);
        }, failure: (error) {
          context.pop();
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Icon(Icons.error_outline, color: Colors.red),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('error${error.apiErrorModel.message}')],
              ),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('Ok'),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
