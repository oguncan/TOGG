import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:togg/common/common.dart';
import 'package:togg/components/border_button_with_bg.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  Widget _wrapWithMaterialApp(Widget appRaisedButton) {
    return MaterialApp(
      home: appRaisedButton,
    );
  }

  testWidgets('Custom Border Button', (tester) async {
    final widget = BorderButtonWithBackgroundColor(
      text: "Login",
      color: AppColors.toggColor,
      textColor: AppColors.white,
      borderColor: AppColors.toggColor,
      onClickAction: () {},
    );

    await tester.pumpWidget(_wrapWithMaterialApp(_wrapWithMaterialApp(widget)));

    expect(find.byType(OutlinedButton), findsOneWidget);
    
  });
}