import 'package:flutter_test/flutter_test.dart';

import 'package:learning_dart/main.dart';

void main() {
  testWidgets('Does it load', (WidgetTester tester) async {
    await tester.pumpWidget(const Fooderlich());
  });
}
