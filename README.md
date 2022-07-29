# async_action_button

[![CI](https://github.com/zippa-pizza/async_action_button/actions/workflows/ci.yml/badge.svg?event=push)](https://github.com/zippa-pizza/async_action_button/actions/workflows/ci.yml)

![Pub Version](https://img.shields.io/pub/v/async_action_button)
![GitHub](https://img.shields.io/github/license/zippa-pizza/async_action_button)

![Coverage](https://github.com/zippa-pizza/async_action_button/raw/main/coverage_badge.svg)

A button that, when tapped, shows a loading indicator. Useful for asynchronous actions that may take some time to complete.

## Usage

```dart
import 'package:async_action_button/async_action_button.dart';

AsyncActionButton(
  text: 'Submit',
  onPressed: () => Future.delayed(const Duration(seconds: 1)),
);
```
