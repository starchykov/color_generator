import 'package:color_generator/core/core.dart';
import 'package:color_generator/features/authentication/view/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A custom widget that creates a login input.
class LoginUsername extends StatelessWidget {
  /// Default [LoginUsername] widget constructs.
  const LoginUsername({super.key});

  @override
  Widget build(BuildContext context) {
    const double inputHeight = 55;
    final AuthCubit cubit = context.read<AuthCubit>();

    return Container(
      height: inputHeight,
      margin: const EdgeInsets.only(top: Sizes.p20),
      child: CupertinoTextField(
        style: const TextStyle(color: Palette.white),
        placeholderStyle: const TextStyle(color: Palette.white),
        placeholder: 'Login',
        prefix: const Padding(
          padding: EdgeInsets.only(left: Sizes.p12),
          child: Icon(
            CupertinoIcons.person_crop_circle_fill,
            color: Palette.white,
          ),
        ),
        decoration: const BoxDecoration(
          color: Palette.lightGray,
          borderRadius: BorderRadius.all(Radius.circular(Sizes.p8)),
        ),
        onChanged: (value) => cubit.onLoginPrint(value: value),
      ),
    );
  }
}
