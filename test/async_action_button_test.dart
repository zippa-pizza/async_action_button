import 'package:async_action_button/async_action_button.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_test/flutter_test.dart';

import '../example/main.dart';

void main() {
  testWidgets(
    'The loading indicator is shown',
    (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const App());

        final button = find.byType(AsyncActionButton);

        expect(button, findsOneWidget);

        await tester.tap(button);
        await tester.pump();

        expect(find.byType(adaptive.Spinner), findsOneWidget);

        await Future.delayed(kLoadingDuration);
        await tester.pump();

        expect(find.byType(adaptive.Spinner), findsNothing);
      });
    },
  );
}
