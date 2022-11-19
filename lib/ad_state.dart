import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  static String get bannerAdUnitID =>
      Platform.isAndroid ? 'ca-app-pub-3940256099942544/6300978111' : '	/6499/example/banner';

  BannerAdListener get adListener => _adListener;

  final BannerAdListener _adListener =
      BannerAdListener(onAdLoaded: (ad) => print("ad loaded"));
}
