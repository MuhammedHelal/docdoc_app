import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/extentions.dart';
import 'package:flutter_advanced/core/routing/routes_strings.dart';
import 'package:flutter_advanced/core/theming/colors.dart';
import 'package:flutter_advanced/core/theming/text_styles.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            context.pop();

            context.pushReplacementNamed(RoutesStrings.home);
          },
          failure: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Icon(Icons.error_outline, color: Colors.red),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('${error.apiErrorModel.message}'),
                    Gap(8.h),
                    Text(
                      textAlign: TextAlign.center,
                      'code: ${error.apiErrorModel.code}',
                      style: TextStyles.grey14Normal,
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () {
            showDialog(
              context: context,
              builder: (_) => Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: AppColors.primary,
                  size: 150,
                ),
              ),
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
