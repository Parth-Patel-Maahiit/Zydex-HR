// ignore_for_file: avoid_print

import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zydex_hr/util/app_constants.dart';
import 'package:zydex_hr/util/dimensions.dart';

import '../util/app_color_constants.dart';

class CommonSystemUI {
  static SystemUiOverlayStyle systemStyle = const SystemUiOverlayStyle(
      statusBarColor: AppColorConstants.systemArea,
      systemNavigationBarColor: AppColorConstants.systemArea);
}

void scaffoldMessengerMessage(
    {required String message,
    required BuildContext context,
    Color backgroundColor = Colors.black}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message,
        style: TextStyle(
            color: backgroundColor,
            fontFamily: AppConstants.fontFamaliyNormal)),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.white,
    duration: const Duration(seconds: 4),
    margin: const EdgeInsets.all(10.0),
  ));
}

bool textFieldValidation(TextEditingController controller, String text,
    bool isSelect, BuildContext context) {
  if (controller.text.isEmpty) {
    scaffoldMessengerMessage(
        message: "${isSelect ? "Select" : "Enter"} $text", context: context);
    return false;
  }
  return true;
}

String commondateMathod(DateTime dateString) {
  String formattedDate = DateFormat("dd MMM yyyy").format(dateString);
  return formattedDate;
}

DateTime commonStringIntoTime(String? timeString) {
  if (timeString == null || timeString == "") {
    return DateTime.now();
  }
  DateTime dateTime = DateFormat("hh:mm a").parse(timeString);
  return dateTime;
}

String commonTimeMathod(DateTime datetimeString) {
  String formattedTime = DateFormat("hh:mm a").format(datetimeString);
  return formattedTime;
}

String commonTimeOnlyMathod(DateTime datetimeString) {
  String formattedTime = DateFormat("hh:mm").format(datetimeString);
  return formattedTime;
}

String commonPeriodOnlyMathod(DateTime datetimeString) {
  String formattedTime = DateFormat("a").format(datetimeString);
  return formattedTime;
}

DateTime commonDateTimeMathod(String time) {
  List<String> timeComponents = time.split(":");
  int hours = int.parse(timeComponents[0]);
  int minutes = int.parse(timeComponents[1].split(" ")[0]);
  String period = timeComponents[1].split(" ")[1];

  if (period == "PM" && hours < 12) {
    hours += 12;
  }

  DateTime currentTime = DateTime.now();
  DateTime dateTime = DateTime(
    currentTime.year,
    currentTime.month,
    currentTime.day,
    hours,
    minutes,
  );

  return dateTime;
}

String formatDateApi(String dateString) {
  if (dateString == "") {
    return 'Today';
  }
  DateTime dateTime = DateTime.parse(dateString);
  DateTime now = DateTime.now();

  // Check if the date is today
  if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day) {
    return 'Today'; // If today, return 'Today'
  } else {
    // If not today, format the date as 'dd MMM yyyy'
    return DateFormat('dd MMM yyyy').format(dateTime);
  }
}

String commonGetDurationTime(String minutesValue, String secondsValue) {
  if (minutesValue.replaceAll(" ", "") == "") {
    minutesValue = "0";
  }
  if (secondsValue.replaceAll(" ", "") == "") {
    secondsValue = "0";
  }
  double minutes = double.parse(minutesValue);
  double seconds = double.parse(secondsValue);
  int totalTime = ((minutes * 60) + (seconds)).toInt();
  return totalTime.toString();
}

String metersToKilometersAndMiles(String meters, unit) {
  List<String> distanceUnitList = ["distance_unit_1".tr, "distance_unit_2".tr];
  if (meters == "") {
    return "0";
  }
  double metersdistance = double.parse(meters.toString());
  double metersPermilesandKm = 1.0;
  if (unit.toString() == "1") {
    metersPermilesandKm = 1609.344;
  } else {
    metersPermilesandKm = 1000;
  }

  return "${(metersdistance / metersPermilesandKm).toStringAsFixed(2)} ${distanceUnitList[int.parse(unit.toString()) - 1]}";
}

String getMinutes(String totalTime) {
  if (totalTime == "") {
    return "0";
  }
  int minutes = int.parse(totalTime) ~/ 60;
  return minutes.toString();
}

String getSeconds(String totalTime) {
  if (totalTime == "") {
    return "0";
  }
  int seconds = int.parse(totalTime) % 60;
  return seconds.toString();
}

/* Future<String> getCountryId(String name) async {
  var countryData = await getStoreApidata(AppConstants.getCountrieData);
  String countryId = "1";
  getcountries.Data getCountries = getcountries.Data();
  if (countryData != null) {
    getCountries = getcountries.Data.fromJson(countryData);
    for (var element in getCountries.rows!) {
      if (element.name.toString() == name) {
        countryId = element.countryId.toString();
      }
    }
  }
  return countryId;
} */

const List<String> routeStatus = [
  "Open",
  "Active",
  "In Route",
  "Done",
];

const List<String> timeList = ["AM", "PM"];

// optimization Screen List
const List<String> actionOptimizationList = [
  "",
  "optimize",
  "start",
  "reoptimize",
  "done",
  "failed",
  "next"
];
const List<String> stopstype = ["start", "stop", "end", "break"];
List<String> stopsStatingTitleTimeline = [
  "start_from".tr,
  "stop".tr,
  "end_to".tr,
  "break".tr
];

/* const List<MapType> googleMapType = [
  MapType.normal,
  MapType.hybrid,
  MapType.satellite
];

const List<String> stopstypeWithTimeLineImages = [
  Images.startcolorIcon,
  Images.stopcolorIcon,
  Images.endcolorIcon,
  Images.breakcolorIcon
];

const List<String> stopstypeWithMapImages = [
  Images.startcolorborderIcon,
  Images.stopcolorborderIcon,
  Images.endcolorborderIcon,
  Images.breakcolorborderIcon
];
 */
Widget divider() {
  return Container(
      color: AppColorConstants.borderColor,
      width: Dimensions.screenwidth,
      height: 1.5);
}

/* route Optimization
String getTotalTimeDuretion(List<RouteModel> otimizationList) {
  Duration totalDuration = const Duration();
  for (var i = 0; i < otimizationList.length - 1; i++) {
    DateTime startTime =
        DateFormat('h:mm a').parse(otimizationList[i].startime);
    DateTime endTime =
        DateFormat('h:mm a').parse(otimizationList[i + 1].startime);

    // Calculate the duration between consecutive start times
    Duration routeDuration = endTime.difference(startTime);

    totalDuration += routeDuration;
  }
  return "${totalDuration.inHours} hr ${totalDuration.inMinutes.remainder(60)} min";
} */

String convertSecondsToTime(int seconds, {isMinutesShow = false}) {
  // Calculate hours
  int hours = seconds ~/ 3600;
  // Calculate remaining seconds after removing hours
  seconds %= 3600;
  // Calculate minutes
  int minutes = seconds ~/ 60;
  // Calculate remaining seconds after removing minutes
  seconds %= 60;
  // Create a string representation of the time
  // ${seconds.toString().padLeft(2, '0')}
  String timeString = hours == 0
      ? '$minutes min'
      : '$hours hr${isMinutesShow ? " ${minutes.toString().padLeft(2, '0')} min" : ""}';

  return timeString;
}

// language
commonLanguageChanger(languageSlag) async {
  print("languageSlag ===> $languageSlag");
  switch (languageSlag) {
    case 'en':
      Get.updateLocale(const Locale('en', 'US'));
      break;
    case 'es':
      Get.updateLocale(const Locale('es', 'AI'));
      break;
    case 'pt':
      Get.updateLocale(const Locale('pt', 'AO'));
      break;
    case 'fr':
      Get.updateLocale(const Locale('fr', 'FR'));
      break;
    default:
      Get.updateLocale(const Locale('en', 'US'));
      break;
  }
}

// svg to bitmap
Future<Uint8List> bitmapDescriptorFromSvgAsset(
  String assetName, [
  Size size = const Size(80, 80),
]) async {
  final pictureInfo = await vg.loadPicture(SvgAssetLoader(assetName), null);

  double devicePixelRatio =
      ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
  int width = (size.width * devicePixelRatio).toInt();
  int height = (size.height * devicePixelRatio).toInt();

  final scaleFactor = min(
    width / pictureInfo.size.width,
    height / pictureInfo.size.height,
  );

  final recorder = ui.PictureRecorder();

  ui.Canvas(recorder)
    ..scale(scaleFactor)
    ..drawPicture(pictureInfo.picture);

  final rasterPicture = recorder.endRecording();

  final image = rasterPicture.toImageSync(width, height);
  final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!;

  return bytes.buffer.asUint8List();
}

// Image to bitmap
Future<Uint8List> getbytesFormAssetd(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetHeight: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

// Function to compare times
int compareTime(String timeA, String timeB) {
  DateTime aTime = DateFormat('h:mm a').parse(timeA);
  DateTime bTime = DateFormat('h:mm a').parse(timeB);
  return aTime.compareTo(bTime);
}

//String svg to bitmap
Future<Uint8List> bitmapDescriptorFromSvgString(
  String imagePath, [
  Size size = const Size(80, 80),
]) async {
  final pictureInfo = await vg.loadPicture(SvgStringLoader(imagePath), null);
  double devicePixelRatio =
      ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
  int width = (size.width * devicePixelRatio).toInt();
  int height = (size.height * devicePixelRatio).toInt();

  final scaleFactor = min(
    width / pictureInfo.size.width,
    height / pictureInfo.size.height,
  );

  final recorder = ui.PictureRecorder();

  ui.Canvas(recorder)
    ..scale(scaleFactor)
    ..drawPicture(pictureInfo.picture);

  final rasterPicture = recorder.endRecording();

  final image = rasterPicture.toImageSync(width, height);
  final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!;

  return bytes.buffer.asUint8List();
}

String getOptimizationRouteSvg(String count) {
  String svgString = '''
<svg width="76" height="76" viewBox="0 0 76 76" fill="none" xmlns="http://www.w3.org/2000/svg">
<g filter="url(#filter0_d_2584_1217)">
<circle cx="38" cy="30" r="14" fill="#09A158"/>
</g>
<circle cx="38" cy="30" r="12" fill="white"/>
<g clip-path="url(#clip0_2584_1217)">
<g clip-path="url(#clip1_2584_1217)">
<path d="M41.5 24H34.5C33.1215 24 32 25.1215 32 26.5V33.5C32 34.8785 33.1215 36 34.5 36H41.5C42.8785 36 44 34.8785 44 33.5V26.5C44 25.1215 42.8785 24 41.5 24ZM43 33.5C43 34.327 42.327 35 41.5 35H34.5C33.673 35 33 34.327 33 33.5V26.5C33 25.673 33.673 25 34.5 25H41.5C42.327 25 43 25.673 43 26.5V33.5ZM37.773 26.5H36.75C35.785 26.5 35 27.285 35 28.25V31.75C35 32.715 35.785 33.5 36.75 33.5H37.773C39.5525 33.5 41 32.052 41 30.2725V29.727C41 27.9475 39.552 26.5 37.773 26.5ZM40 30.2725C40 31.5005 39.001 32.5 37.773 32.5H36.75C36.3365 32.5 36 32.1635 36 31.75V28.25C36 27.8365 36.3365 27.5 36.75 27.5H37.773C39.001 27.5 40 28.4995 40 29.7275V30.2725Z" fill="black"/>
</g>
</g>
<rect x="32" y="24" width="12" height="12" fill="white" rx="3"/>
<text x="38" y="35" text-anchor="middle" dominant-baseline="middle" fill="black">$count</text>
<defs>
<filter id="filter0_d_2584_1217" x="0" y="0" width="76" height="76" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feMorphology radius="4" operator="dilate" in="SourceAlpha" result="effect1_dropShadow_2584_1217"/>
<feOffset dy="8"/>
<feGaussianBlur stdDeviation="10"/>
<feComposite in2="hardAlpha" operator="out"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.18 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_2584_1217"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_2584_1217" result="shape"/>
</filter>
<clipPath id="clip0_2584_1217">
<rect width="12" height="12" fill="white" transform="translate(32 24)"/>
</clipPath>
<clipPath id="clip1_2584_1217">
<rect width="12" height="12" fill="white" transform="translate(32 24)"/>
</clipPath>
</defs>
</svg>
''';
  return svgString;
}

String getTimeLineRouteSvg(String count) {
  String svgString = '''
<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M12.6667 0H3.33333C1.49533 0 0 1.49533 0 3.33333V12.6667C0 14.5047 1.49533 16 3.33333 16H12.6667C14.5047 16 16 14.5047 16 12.6667V3.33333C16 1.49533 14.5047 0 12.6667 0ZM14.6667 12.6667C14.6667 13.7693 13.7693 14.6667 12.6667 14.6667H3.33333C2.23067 14.6667 1.33333 13.7693 1.33333 12.6667V3.33333C1.33333 2.23067 2.23067 1.33333 3.33333 1.33333H12.6667C13.7693 1.33333 14.6667 2.23067 14.6667 3.33333V12.6667ZM7.69733 3.33333H6.33333C5.04667 3.33333 4 4.38 4 5.66667V10.3333C4 11.62 5.04667 12.6667 6.33333 12.6667H7.69733C10.07 12.6667 12 10.736 12 8.36333V7.636C12 5.26333 10.0693 3.33333 7.69733 3.33333ZM10.6667 8.36333C10.6667 10.0007 9.33467 11.3333 7.69733 11.3333H6.33333C5.782 11.3333 5.33333 10.8847 5.33333 10.3333V5.66667C5.33333 5.11533 5.782 4.66667 6.33333 4.66667H7.69733C9.33467 4.66667 10.6667 5.99933 10.6667 7.63667V8.36333Z" fill="#09A158"/>
<rect x="1" y="1" width="14" height="14" fill="white" rx="4" ry="4"/>
<text x="8" y="12" dominant-baseline="middle" text-anchor="middle" fill="black" font-size="10">$count</text>
</svg>
''';
  return svgString;
}

class RemoteConfig {
  int? isDeletable;
  int? isDuplicate;
  int? isExported;
  int? isOptimize;
  int? isStartRoute;
  int? isStopDeletable;
  int? limitAddedStop;
  int? limitCreationRoute;
  String? privacyPolicyURL;
  String? termsURL;

  RemoteConfig({
    this.isDeletable,
    this.isDuplicate,
    this.isExported,
    this.isOptimize,
    this.isStartRoute,
    this.isStopDeletable,
    this.limitAddedStop,
    this.limitCreationRoute,
    this.privacyPolicyURL,
    this.termsURL,
  });
}

/* Future<RemoteConfig> getInsilizeData() async {
  getSubscriptionInfo();
  RemoteConfig remoteConfiginfo = RemoteConfig();
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(minutes: 5),
  ));
  await remoteConfig.fetch();
  remoteConfiginfo = RemoteConfig(
      isDeletable: remoteConfig.getInt("is_deletable"),
      isDuplicate: remoteConfig.getInt("is_duplicate"),
      isExported: remoteConfig.getInt("is_exported"),
      isOptimize: remoteConfig.getInt("is_optimize"),
      isStartRoute: remoteConfig.getInt("is_start_route"),
      isStopDeletable: remoteConfig.getInt("is_stop_deletable"),
      limitAddedStop: remoteConfig.getInt("limit_added_stop"),
      limitCreationRoute: remoteConfig.getInt("limit_creation_route"),
      privacyPolicyURL: remoteConfig.getString("privacy_policy_url"),
      termsURL: remoteConfig.getString("terms_url"));
  remoteConfig.onConfigUpdated.listen((event) async {
    await remoteConfig.fetchAndActivate();
    remoteConfiginfo = RemoteConfig(
        isDeletable: remoteConfig.getInt("is_deletable"),
        isDuplicate: remoteConfig.getInt("is_duplicate"),
        isExported: remoteConfig.getInt("is_exported"),
        isOptimize: remoteConfig.getInt("is_optimize"),
        isStartRoute: remoteConfig.getInt("is_start_route"),
        isStopDeletable: remoteConfig.getInt("is_stop_deletable"),
        limitAddedStop: remoteConfig.getInt("limit_added_stop"),
        limitCreationRoute: remoteConfig.getInt("limit_creation_route"),
        privacyPolicyURL: remoteConfig.getString("privacy_policy_url"),
        termsURL: remoteConfig.getString("terms_url"));
  });
  return remoteConfiginfo;
}

void gotoSubScrptionScreen(
    BuildContext context, final Function? getReloadSubscriptionInfo) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SubScriptionScreen(),
      )).whenComplete(
    () {
      if (getReloadSubscriptionInfo != null) {
        getReloadSubscriptionInfo();
      }
    },
  );
} */

/* Future<bool> getSubscriptionInfo() async {
  bool isSubscriptionActive = false;
  bool isExpiryDateIsPass = true;
  getsubscriptionmodel.GetSubscriptionModel getSubscriptionModel =
      getsubscriptionmodel.GetSubscriptionModel();
  var token = await getToken();

  var response = await CommonApiCall.getApiCall(
      action: "subscription", headers: {"Authorization": token});
  if (response.statusCode == 200) {
    try {
      final responseData = json.decode(response.body);
      if (responseData != null) {
        getSubscriptionModel =
            getsubscriptionmodel.GetSubscriptionModel.fromJson(responseData);
        if (getSubscriptionModel.data != null &&
            getSubscriptionModel.data!.isNotEmpty) {
          DateTime expiryDate = DateTime.parse(getSubscriptionModel
              .data!.first.subscriptionExpiryDate
              .toString());
          DateTime today = DateTime.now();
          if (expiryDate.isBefore(today)) {
            isExpiryDateIsPass = true;
          } else {
            isExpiryDateIsPass = false;
          }
          if (!isExpiryDateIsPass &&
              getSubscriptionModel.data!.first.subscriptionStatus == "Active") {
            isSubscriptionActive = true;
          }
        }
      }
    } catch (e) {
      print('error ==>  ${e.toString()}');
      isSubscriptionActive = false;
    }
  } else {
    isSubscriptionActive = false;
    print('error ==>  ${response.statusCode}');
  }
  return isSubscriptionActive;
} */

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}
