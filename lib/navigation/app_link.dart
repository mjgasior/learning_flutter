class AppLink {
  static const String kHomePath = '/home';
  static const String kOnboardingPath = '/onboarding';
  static const String kLoginPath = '/login';
  static const String kProfilePath = '/profile';
  static const String kItemPath = '/item';

  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';

  String? location;
  int? currentTab;
  String? itemId;

  AppLink({this.location, this.currentTab, this.itemId});

  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');

    final uri = Uri.parse(location);
    final params = uri.queryParameters;
    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');
    final itemId = params[AppLink.kIdParam];

    final link = AppLink(
      location: uri.path,
      currentTab: currentTab,
      itemId: itemId,
    );

    return link;
  }

  String toLocation() {
    String addKeyValuePair({required String key, String? value}) =>
        value == null ? '' : '${key}=$value&';

    switch (location) {
      case kLoginPath:
        return kLoginPath;
      case kOnboardingPath:
        return kOnboardingPath;
      case kProfilePath:
        return kProfilePath;
      case kItemPath:
        var newLocation = '$kHomePath?';
        newLocation += addKeyValuePair(key: kIdParam, value: itemId);
        return Uri.encodeFull(newLocation);
      default:
        var newHomeLocation = '$kHomePath';
        newHomeLocation +=
            addKeyValuePair(key: kTabParam, value: currentTab.toString());
        return Uri.encodeFull(newHomeLocation);
    }
  }
}
