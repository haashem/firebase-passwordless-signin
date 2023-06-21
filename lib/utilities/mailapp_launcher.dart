import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';

typedef UrlLauncher = Future<bool> Function(Uri url);

class MailAppLauncher {
  final AndroidIntent intent;
  final TargetPlatform _platform;
  final UrlLauncher _launchUrl;

  MailAppLauncher({
    required TargetPlatform platform,
    required UrlLauncher urlLauncher,
    this.intent = const AndroidIntent(
      action: 'android.intent.action.MAIN',
      category: 'android.intent.category.APP_EMAIL',
    ),
  })  : _platform = platform,
        _launchUrl = urlLauncher;

  Future<void> launch() async {
    if (_platform == TargetPlatform.android) {
      intent.launch();
      return;
    } else {
      await _launchUrl(Uri.parse('message://'));
      return;
    }
  }
}
