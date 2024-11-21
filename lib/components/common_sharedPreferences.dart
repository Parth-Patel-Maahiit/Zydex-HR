import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/app_constants.dart';

Future<String> getToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? stringData = sharedPreferences.getString(AppConstants.token);
  return stringData!;
}

/* Future<DefaultValueModel> getDefultValues() async {
  DefaultValueModel defaultValueModel = DefaultValueModel();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  defaultValueModel = DefaultValueModel(
    defaultTime: sharedPreferences.getInt(AppConstants.defaultTime),
    roadSide: sharedPreferences.getString(AppConstants.roadSide),
    packgeId: sharedPreferences.getString(AppConstants.packgeId),
    optimizationPreferance:
        sharedPreferences.getString(AppConstants.optimizationPreferance),
    units: sharedPreferences.getString(AppConstants.units),
    defaultNavigationMap:
        sharedPreferences.getString(AppConstants.defaultNavigationMap),
    vehicalTypeId: sharedPreferences.getInt(AppConstants.vehicalTypeId),
    vehicalImage: sharedPreferences.getString(AppConstants.vehicalImage),
    mapType: sharedPreferences.getString(AppConstants.mapType),
    theme: sharedPreferences.getString(AppConstants.theme),
    paltfrom: sharedPreferences.getString(AppConstants.paltfrom),
    appVersion: sharedPreferences.getString(AppConstants.appVersion),
  );
  // print("defaultTime === > ${_defaultValueModel.defaultTime}");
  // print("roadSide === > ${_defaultValueModel.roadSide}");
  // print("packgeId === > ${_defaultValueModel.packgeId}");
  // print(
  //     "optimizationPreferance === > ${_defaultValueModel.optimizationPreferance}");
  // print(
  //     "defaultNavigationMap === > ${_defaultValueModel.defaultNavigationMap}");
  // print("vehicalTypeId === > ${_defaultValueModel.vehicalTypeId}");
  // print("vehicalImage === > ${_defaultValueModel.vehicalImage}");
  // print("mapType === > ${_defaultValueModel.mapType}");
  // print("theme === > ${_defaultValueModel.theme}");
  // print("paltfrom === > ${_defaultValueModel.paltfrom}");
  // print("appVersion === > ${_defaultValueModel.appVersion}");
  return defaultValueModel;
}

Future<void> setDefultValues(DefaultValueModel defaultValueModel) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  if (defaultValueModel.defaultTime != null) {
    sharedPreferences.setInt(
        AppConstants.defaultTime, defaultValueModel.defaultTime!);
  }
  if (defaultValueModel.roadSide != null) {
    sharedPreferences.setString(
        AppConstants.roadSide, defaultValueModel.roadSide!);
  }
  if (defaultValueModel.packgeId != null) {
    sharedPreferences.setString(
        AppConstants.packgeId, defaultValueModel.packgeId!);
  }
  if (defaultValueModel.optimizationPreferance != null) {
    sharedPreferences.setString(AppConstants.optimizationPreferance,
        defaultValueModel.optimizationPreferance!);
  }
  if (defaultValueModel.units != null) {
    sharedPreferences.setString(AppConstants.units, defaultValueModel.units!);
  }
  if (defaultValueModel.defaultNavigationMap != null) {
    sharedPreferences.setString(AppConstants.defaultNavigationMap,
        defaultValueModel.defaultNavigationMap!);
  }
  if (defaultValueModel.vehicalTypeId != null) {
    sharedPreferences.setInt(
        AppConstants.vehicalTypeId, defaultValueModel.vehicalTypeId!);
  }
  if (defaultValueModel.vehicalImage != null) {
    sharedPreferences.setString(
        AppConstants.vehicalImage, defaultValueModel.vehicalImage!);
  }
  if (defaultValueModel.mapType != null) {
    sharedPreferences.setString(
        AppConstants.mapType, defaultValueModel.mapType!);
  }
  if (defaultValueModel.theme != null) {
    sharedPreferences.setString(AppConstants.theme, defaultValueModel.theme!);
  }
  if (defaultValueModel.paltfrom != null) {
    sharedPreferences.setString(
        AppConstants.paltfrom, defaultValueModel.paltfrom!);
  }
  if (defaultValueModel.appVersion != null) {
    sharedPreferences.setString(
        AppConstants.appVersion, defaultValueModel.appVersion!);
  }
}
 */
Future<void> setStringData(key, value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(key, value);
}

Future<String> getStringData(key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getString(key) == null) {
    return "";
  }
  String? stringData = sharedPreferences.getString(key);
  return stringData!;
}

Future<void> clearAllSharedPreferencesData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.clear();
}

Future<void> removeSharedPreferencesData(key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove(key);
}

Future<void> setStoreApidata(key, value) async {
  final valueJson = value?.toJson();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(key, jsonEncode(valueJson));
}

Future<void> setStoreApiListdata(key, List<Map<String, dynamic>> value) async {
  if (value != []) {
    final List<Map<String, dynamic>> valueJsonList =
        value.map((status) => status).toList();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, jsonEncode(valueJsonList));
  }
}

Future<dynamic> getStoredApiListdata(String key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? jsonString = sharedPreferences.getString(key);
  if (jsonString != null) {
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList;
  } else {
    return [];
  }
}

Future<dynamic> getStoreApidata(key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final storedDataJson = sharedPreferences.getString(key);
  if (storedDataJson != null) {
    return jsonDecode(storedDataJson);
  }
  return null;
}
