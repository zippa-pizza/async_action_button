import 'package:async_action_button/async_action_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AsyncActionButton(
            text: 'Submit',
            onPressed: () => Future.delayed(const Duration(seconds: 1)),
          ),
        ),
      ),
    );
  }
}
