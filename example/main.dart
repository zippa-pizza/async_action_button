import 'package:async_action_button/async_action_button.dart';
import 'package:flutter/material.dart';

const kLoadingDuration = Duration(seconds: 1);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: const TextButtonThemeData(style: ButtonStyle()),
      ),
      home: Scaffold(
        body: Center(
          child: AsyncActionButton(
            text: 'Submit',
            onPressed: () => Future.delayed(kLoadingDuration),
          ),
        ),
      ),
    );
  }
}
