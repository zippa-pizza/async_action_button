# async_action_button

A button that, when tapped, shows a loading indicator. Useful for asynchronous actions that may take some time to complete.

## Usage

```dart
import 'package:async_action_button/async_action_button.dart';

AsyncActionButton(
  text: 'Submit',
  onPressed: () => Future.delayed(const Duration(seconds: 1)),
);
```
