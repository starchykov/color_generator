import 'package:flutter/cupertino.dart';

/// A custom widget that creates a registration button.
class RegisterButton extends StatelessWidget {
  /// Default [RegisterButton] widget constructs.
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Returns a widget that centers its child within itself.
    return Center(
      // Adds padding around the button.
      child: Padding(
        // Applies uniform padding on the top of the button.
        padding: const EdgeInsets.only(top: 20.0),
        // Uses the `CupertinoButton` widget to create an iOS-style button.
        child: CupertinoButton(
          onPressed: () {
            // TODO(starchykov): Replace it with your business logic.
          },
          child: const Text('Create an account'),
        ),
      ),
    );
  }
}
