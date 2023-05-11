class SignInLinkSettings {
  final String url;
  final String androidPackageName;
  final String iOSBundleId;
  final String dynamicLinkDomain;

  SignInLinkSettings({
    required this.url,
    required this.androidPackageName,
    required this.iOSBundleId,
    required this.dynamicLinkDomain,
  });
}
