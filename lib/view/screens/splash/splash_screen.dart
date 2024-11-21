// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zydex_hr/util/app_color_constants.dart';

import '../../../authflie/notifiction_services.dart';
import '../../../components/common.dart';
import '../../../components/common_sharedPreferences.dart';
import '../../../util/app_constants.dart';
import '../../../util/images.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    NotificationServices.getnotifictionAccess(context);
    getLoginData().whenComplete(() async {
      Timer(const Duration(seconds: 3), () {
        checkNextRoutePage();
      });
    });
    _checkExistingPurchases();
  }

  Future<void> _checkExistingPurchases() async {
    //  GooglePlayPurchaseDetails oldSubscription =
    //         purchases[_kmonthlySubscriptionId]! as GooglePlayPurchaseDetails;
    //   final QueryPurchaseDetailsResponse response = await _inAppPurchase.queryPastPurchases();
    //   if (response.error != null) {
    //     // Handle the error
    //     return;
    //   }
    //   for (PurchaseDetails purchase in response.pastPurchases) {
    //     if (await _verifyPurchase(purchase)) {
    //       _purchases.add(purchase);
    //     }
    //   }
  }

  void checkNextRoutePage() async {
    String isWalkthroughFinish =
        await getStringData(AppConstants.isWalkthroughFinish);
    String isLoginFinish = await getStringData(AppConstants.isLoginFinish);
    String languageSlag = await getStringData(AppConstants.languageCode);
    print("isWalkthroughFinish === > $isWalkthroughFinish");
    /*   if (languageSlag == "") {
      nextScreen();
      //  const LanguageChangesScreen(
      //     isFromWhere: 0,
      //     isback: false,
      //   ),
    } else if (isWalkthroughFinish == "" || isWalkthroughFinish != "yes") {
      commonLanguageChanger(languageSlag);
      nextScreen();
      // const WalkthoughScreen()
    } else  */
    if (isLoginFinish == "" || isLoginFinish != "yes") {
      commonLanguageChanger(languageSlag);
      nextScreen(
        widget: const LoginScreen(),
      );
      // const BaseSacreen()
    } else {
      commonLanguageChanger(languageSlag);
      nextScreen();
      // const DashboardScreen(
      //     pageIndex: 0,
      //   ),
    }
  }

  void nextScreen({Widget? widget}) {
    if (widget == null) {
      return;
    }
    Navigator.pushReplacement(
      context,
      PageTransition(
        child: widget,
        type: PageTransitionType.leftToRight,
      ),
    );
  }

  Future<void> getLoginData() async {}
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColorConstants.baseBG,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                Images.splashAnimation,
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 30.0,
                    color: AppColorConstants.black,
                    fontFamily: AppConstants.fontFamaliyNormal,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: AppConstants.appNameStart,
                        style: TextStyle(
                          fontFamily: AppConstants.fontFamaliyNormal,
                          fontWeight: FontWeight.bold,
                          color: AppColorConstants.brightBlue,
                        )),
                    TextSpan(
                        text: ' ${AppConstants.appNameEnd}',
                        style: TextStyle(
                          color: AppColorConstants.black,
                          fontFamily: AppConstants.fontFamaliyNormal,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
