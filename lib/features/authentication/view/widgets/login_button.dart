import 'package:color_generator/features/authentication/view/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A custom widget that creates a login button.
class LoginButton extends StatelessWidget {
  /// Default [LoginButton] widget constructs.
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    const double buttonHeight = 55;
    final AuthCubit cubit = context.read<AuthCubit>();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          height: buttonHeight,
          margin: const EdgeInsets.only(top: 30.0),
          child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            disabledColor: CupertinoColors.systemBlue,
            onPressed: state.loginButtonState == LoginButtonState.canSubmit
                ? cubit.onLoginButtonPress
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: cubit.state.authInProcess,
                  child: const CupertinoActivityIndicator(
                    color: CupertinoColors.white,
                  ),
                ),
                Visibility(
                  visible: !cubit.state.authInProcess,
                  child: const Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(color: CupertinoColors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        CupertinoIcons.arrow_right_circle,
                        color: CupertinoColors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
