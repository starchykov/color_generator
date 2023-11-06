import 'package:color_generator/core/core.dart';
import 'package:flutter/cupertino.dart';

/// A custom widget that creates a logo image on the login page.
class LoginPageLogo extends StatelessWidget {
  /// Default [LoginPageLogo] widget constructs.
  const LoginPageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Sizes.p32,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.icLogo),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        gapH16,
        const Text(
          'App version 1.0.0',
          style: TextStyle(
            color: CupertinoColors.inactiveGray,
            fontWeight: FontWeight.w300,
            fontSize: Sizes.p12,
          ),
        ),
        gapH16,
      ],
    );
  }
}
