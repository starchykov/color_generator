import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/authentication/view/widgets/widgets.dart';

import 'package:flutter/cupertino.dart';

/// Represents the login screen in the application.
/// It's a stateless widget, indicating that it does not hold any state.
class LoginScreen extends StatelessWidget {
  /// Default [LoginScreen] widget constructs.
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double headerIconHeight = 180;

    return CupertinoPageScaffold(
      backgroundColor: Palette.backgroundDark,
      child: Form(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(Sizes.p16),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                const Spacer(),
                Image.asset(Images.icLauncher, height: headerIconHeight),
                const Spacer(),
                const LoginUsername(),
                const LoginPassword(),
                const LoginButton(),
                const RegisterButton(),
                const Spacer(),
                const Spacer(),
                const LoginPageLogo(),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '© 2022-2023 Copyright Starchykov',
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                ),
                gapH16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
