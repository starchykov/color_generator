import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/authentication/view/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A custom widget that creates a password input.
class LoginPassword extends StatelessWidget {
  /// Default [LoginPassword] widget constructs.
  const LoginPassword({super.key});

  @override
  Widget build(BuildContext context) {
    const double inputHeight = 55;
    const double shownOpacity = 0.2;
    const double hiddenOpacity = 0.6;
    final AuthCubit cubit = context.read<AuthCubit>();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          height: inputHeight,
          margin: const EdgeInsets.only(top: Sizes.p20),
          child: CupertinoTextField(
            style: const TextStyle(color: CupertinoColors.white),
            placeholderStyle: const TextStyle(color: CupertinoColors.white),
            prefix: const Padding(
              padding: EdgeInsets.only(left: Sizes.p12),
              child: Icon(
                CupertinoIcons.lock_circle_fill,
                color: CupertinoColors.white,
              ),
            ),
            obscureText: state.hidePassword,
            placeholder: 'Password',
            suffix: GestureDetector(
              onLongPressStart: (_) => cubit.showPassword(),
              onLongPressEnd: (_) => cubit.showPassword(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
                child: Icon(
                  CupertinoIcons.eye_fill,
                  size: Sizes.p16,
                  color: CupertinoColors.white.withOpacity(
                    state.hidePassword
                        ? hiddenOpacity
                        : shownOpacity,
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Palette.lightGray,
              borderRadius: BorderRadius.all(Radius.circular(Sizes.p8)),
            ),
            onChanged: (value) => cubit.onPasswordPrint(value: value),
          ),
        );
      },
    );
  }
}
