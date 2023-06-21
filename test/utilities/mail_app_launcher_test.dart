import 'package:android_intent_plus/android_intent.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/utilities/mailapp_launcher.dart';

class MockAndroidIntent extends Mock implements AndroidIntent {}

void main() {
  late MailAppLauncher sut;

  tearDown(() => getIt.reset());

  test('On iOS uses LaunchUrl', () {
    // Given
    final List<Uri> iOSLauncherMessages = [];

    sut = MailAppLauncher(
      platform: TargetPlatform.iOS,
      urlLauncher: (uri) async {
        iOSLauncherMessages.add(uri);
        return true;
      },
    );

    // When
    sut.launch();

    // Then
    expect(iOSLauncherMessages, [Uri.parse('message://')]);
  });

  group('On Android', () {
    test('Uses AndroidIntent', () {
      // Given
      final intent = MockAndroidIntent();
      sut = MailAppLauncher(
        platform: TargetPlatform.android,
        urlLauncher: (_) async {
          return true;
        },
        intent: intent,
      );
      when(
        () => intent.launch(),
      ).thenAnswer((_) async => {});

      // When
      sut.launch();

      // Then
      verify(intent.launch).called(1);
    });

    test('AndroidIntent is properly configured for launching email app',
        () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupPackageInfoPlusMethodChannelMock();
      setupFirebaseCoreMocks();
      await configureInjection();

      final intent = getIt<MailAppLauncher>().intent;
      expect(intent.action == 'android.intent.action.MAIN', isTrue);
      expect(intent.category == 'android.intent.category.APP_EMAIL', isTrue);
    });
  });
}

void setupPackageInfoPlusMethodChannelMock() {
  const channel = MethodChannel('dev.fluttercommunity.plus/package_info');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    channel,
    (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getAll':
          return <String, dynamic>{
            'appName': 'sample_app_name',
          };
        default:
          return null;
      }
    },
  );
}
