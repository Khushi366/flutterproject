import 'dart:developer';

import 'package:admob/resources/AdResources.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//ca-app-pub-4357235216814865~1420879259 --app id

//ca-app-pub-4357235216814865/8885470145
//ca-app-pub-4357235216814865/7752351876

//intreastial
//ca-app-pub-4357235216814865~1420879259
//ca-app-pub-4357235216814865/4003381385

class _MyHomePageState extends State<MyHomePage> {


  bool _istop=false;
  BannerAd? _topBannerAd;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  var count;


  loadtopbanner()
  {
    _topBannerAd = BannerAd(
      adUnitId: AdResources.TOP_BANNER,
      size: AdSize.largeBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _istop = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _topBannerAd!.load();
  }


  loadinterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdResources.INTE1,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _interstitialAd?.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _interstitialAd = null;
          },
        ));
  }

  showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),

      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        loadinterstitialAd();
        SystemNavigator.pop();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        loadinterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }


  createRewardedAd() async{
    RewardedAd.load(
      adUnitId:"ca-app-pub-3940256099942544/5224354917",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;

          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            createRewardedAd();
          }),);
  }

  showRewardedAd()async {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
        });
    // _rewardedAd!.show(onUserEarnedReward: );
    _rewardedAd = null;
  }


  checkcount()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("count")){
      setState(() {
        count = prefs.getInt("count");
        count++;
        prefs.setInt("count", count);
        log("Pinal : "+count.toString());
      });
    }
    else{
      setState(() {
        prefs.setInt("count", 1);
        count = prefs.getInt("count");
        log("Pinal : "+count.toString());
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkcount();
    loadtopbanner();
    loadinterstitialAd();
    createRewardedAd();
  }



  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // THIS IS IMPORTANT
      onPopInvoked: (didPop) async {
        await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Are you sure you want to exit?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Close the dialog
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    if(prefs.getInt("count")==3){
                      prefs.setInt("count", 0);
                      showInterstitialAd();
                    }
                    else{
                      SystemNavigator.pop();
                    }
                    Navigator.of(context).pop(true); // Confirm exit
                  },
                  child: Text("Exit"),
                ),
              ],
            );
          },

        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Admob",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (_istop)?
            Container(
              height: _topBannerAd!.size.height.toDouble(),
              width: _topBannerAd!.size.width.toDouble(),
              child: AdWidget(ad: _topBannerAd!),
            ):SizedBox(height: 0,),
            SizedBox(height: 20.0,),
            Center(
              child: ElevatedButton(onPressed: (){
                showInterstitialAd();
              }, child: Text("InterstitialAd")),
            ),

            SizedBox(height: 20.0,),
            Center(
              child: ElevatedButton(onPressed: (){
                showRewardedAd();
              }, child: Text("RewardedAd")),
            ),
          ],
        ),
      ),
    );
  }
}


