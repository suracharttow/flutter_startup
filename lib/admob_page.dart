import 'package:flutter/material.dart';
import 'package:flutter_startup/utils/ads_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobPage extends StatefulWidget {
  const AdmobPage({Key? key}) : super(key: key);

  @override
  State<AdmobPage> createState() => _AdmobPageState();
}

//765EFC
class _AdmobPageState extends State<AdmobPage> {
  // TODO: Add _isAdLoaded
  late BannerAd _ad;
  bool _isAdLoaded = false;

  // TODO: Add _interstitialAd
  InterstitialAd? _interstitialAd;
  // TODO: Add _isInterstitialAdReady
  bool _isInterstitialAdReady = false;

  @override
  void initState() {
    super.initState();
    loadAds();
    loadInterstitialAd();
  }

  void loadAds() {
    // TODO: Create a BannerAd instance
    _ad = BannerAd(
      adUnitId: AdsHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Releases an ad resource when it fails to load
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    // TODO: Load an ad
    _ad.load();
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdsHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this._interstitialAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              //_moveToHome();
            },
          );

          _isInterstitialAdReady = true;
          print('interstitial ad: ready');
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdMob Banner Page'),
        elevation: 10,
        backgroundColor: const Color(0xFF765EFC),
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
      body: Container(
        color: Colors.black45,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: _isAdLoaded
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: AdWidget(ad: _ad),
                      width: _ad.size.width.toDouble(),
                      height: 72.0,
                      alignment: Alignment.center,
                    )
                  : Container(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: TextButton(
                child: Text(
                  'Click show InterstitialAd Ads',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // show ads
                  if (_isInterstitialAdReady) {
                    _interstitialAd?.show();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
