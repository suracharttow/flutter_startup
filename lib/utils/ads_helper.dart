import 'dart:io';

class AdsHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-xxxxxxxxx/yyyyyyyy';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-xxxxxxxxx/yyyyyyyy';
    }
    throw new UnsupportedError("Unsupported platform");
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-xxxxxxxxx/yyyyyyyy';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-xxxxxxxxx/yyyyyyyy';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }
}
