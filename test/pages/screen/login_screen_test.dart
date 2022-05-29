import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/src/generated/poi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_macos/path_provider_macos.dart';

import '../../core/mock_core_repository.dart';


void main() async{



  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('Login', (tester) async{
    final userNameField = find.byKey(ValueKey("userNameField"));
    final passwordField = find.byKey(ValueKey("passwordField"));

    final loginButton = find.byKey(ValueKey("loginButton"));

    await tester.pumpWidget(MaterialApp(home: LoginScreen()));
    await tester.enterText(userNameField, "Test");
    await tester.enterText(passwordField, "Togg");

    await tester.tap(loginButton);
    await tester.pump();

  });

}