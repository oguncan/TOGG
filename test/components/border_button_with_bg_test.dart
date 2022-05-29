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

  testWidgets('Custom Border Button With Medium Text Style', (tester) async {

    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context){
          final widget = BorderButtonWithBackgroundColor(
            text: "Login",
            style: CustomTextStyle.mediumText(context),
            color: AppColors.toggColor,
            textColor: AppColors.white,
            borderColor: AppColors.toggColor,
            key: Key(""),
            onClickAction: () {},
          );
          return _wrapWithMaterialApp(_wrapWithMaterialApp(widget));
        }
      )
    );

    expect(find.byType(OutlinedButton), findsOneWidget);

  });

  testWidgets('Custom Border Button With Small Text Style', (tester) async {

    await tester.pumpWidget(
        Builder(
            builder: (BuildContext context){
              final widget = BorderButtonWithBackgroundColor(
                text: "Login",
                style: CustomTextStyle.smallText(context),
                color: AppColors.toggColor,
                textColor: AppColors.white,
                borderColor: AppColors.toggColor,
                key: Key(""),
                onClickAction: () {},
              );
              return _wrapWithMaterialApp(_wrapWithMaterialApp(widget));
            }
        )
    );

    expect(find.byType(OutlinedButton), findsOneWidget);

  });

  testWidgets('Custom Border Button With Extra Small Text Style', (tester) async {

    await tester.pumpWidget(
        Builder(
            builder: (BuildContext context){
              final widget = BorderButtonWithBackgroundColor(
                text: "Login",
                style: CustomTextStyle.extraSmallText(context),
                color: AppColors.toggColor,
                textColor: AppColors.white,
                borderColor: AppColors.toggColor,
                key: Key(""),
                onClickAction: () {},
              );
              return _wrapWithMaterialApp(_wrapWithMaterialApp(widget));
            }
        )
    );

    expect(find.byType(OutlinedButton), findsOneWidget);

  });

  testWidgets('Custom Border Button With Extra-Extra Text Style', (tester) async {

    await tester.pumpWidget(
        Builder(
            builder: (BuildContext context){
              final widget = BorderButtonWithBackgroundColor(
                text: "Login",
                style: CustomTextStyle.extraExtraSmallText(context),
                color: AppColors.toggColor,
                textColor: AppColors.white,
                borderColor: AppColors.toggColor,
                key: Key(""),
                onClickAction: () {},
              );
              return _wrapWithMaterialApp(_wrapWithMaterialApp(widget));
            }
        )
    );

    expect(find.byType(OutlinedButton), findsOneWidget);

  });

  testWidgets('Custom Border Button With Large Text Style', (tester) async {

    await tester.pumpWidget(
        Builder(
            builder: (BuildContext context){
              final widget = BorderButtonWithBackgroundColor(
                text: "Login",
                style: CustomTextStyle.largeText(context),
                color: AppColors.toggColor,
                textColor: AppColors.white,
                borderColor: AppColors.toggColor,
                onClickAction: () {}, key: Key(""),
              );
              return _wrapWithMaterialApp(_wrapWithMaterialApp(widget));
            }
        )
    );

    expect(find.byType(OutlinedButton), findsOneWidget);

  });

}