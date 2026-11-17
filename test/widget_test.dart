import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:when_app/app/app.dart';

void main() {
  testWidgets('WhenApp opens the home page', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: WhenApp()));
    await tester.pumpAndSettle();

    expect(find.text('WhenApp'), findsOneWidget);
  });
}