import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vesit_compass/main.dart';
import 'package:vesit_compass/widgets/MyAppBar.dart';

void main() {
  testWidgets('Splash screen appearance', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(MyAppBar), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('VESIT COMPASS'), findsOneWidget);
  });
}
