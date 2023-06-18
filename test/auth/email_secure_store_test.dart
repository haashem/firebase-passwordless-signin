import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passwordless_signin/auth/email_secure_store.dart';

class FakeFlutterSecureStorage extends Fake implements FlutterSecureStorage {
  final dictionary = <String, String?>{};
  
  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    dictionary[key] = value;
  }

  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    return dictionary[key];
  }
}

void main() {
  late EmailSecureStore sut;
  final FakeFlutterSecureStorage flutterSecureStorage =
      FakeFlutterSecureStorage();
  const email = 'myid@email.com';

  setUp(() {
    sut = EmailSecureStore(flutterSecureStorage);
  });

  test(
    'setEmail, write email to FlutterSecureStore',
    () async {
      await sut.setEmail(email);
      expect(flutterSecureStorage.dictionary.containsValue(email), isTrue);
      expect(flutterSecureStorage.dictionary.length, 1);
    },
  );

  test(
    'getEmail, read emails from FlutterSecureStore',
    () async {
      await sut.setEmail(email);
      final cachedEmail = await sut.getEmail();
      expect(email, cachedEmail);
    },
  );
}
