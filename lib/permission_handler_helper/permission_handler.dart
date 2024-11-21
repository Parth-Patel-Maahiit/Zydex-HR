// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../components/common_sharedPreferences.dart';
import '../util/app_constants.dart';

Future<Map<Permission, PermissionStatus>> requestPermissions() async {
  Map<Permission, PermissionStatus> status = await [
    Permission.location, // ACCESS_FINE_LOCATION (or ACCESS_COARSE_LOCATION)
    Permission.locationWhenInUse,
    Permission.locationAlways, // ACCESS_BACKGROUND_LOCATION
    Permission.notification,
    Permission.camera,
    Permission.photos,
    Permission.videos,
    Permission.accessMediaLocation,
    Permission.manageExternalStorage,
    Permission.storage,
    Permission.audio,
    Permission.microphone,
  ].request();

  for (var entry in status.entries) {
    if (entry.value.isDenied) {
      await entry.key.request();
    }
  }

  return status;
}

Future<Map<Permission, PermissionStatus>> mediaAndCameraPermissions() async {
  Map<Permission, PermissionStatus> status = await [
    Permission.camera,
    Permission.photos,
    Permission.videos,
    Permission.accessMediaLocation,
    // Permission.manageExternalStorage,
    Permission.storage,
  ].request();

  for (var entry in status.entries) {
    if (entry.value.isDenied) {
      await entry.key.request();
    }
  }
  return status;
}

Future<Map<Permission, PermissionStatus>> notificationPermissions() async {
  Map<Permission, PermissionStatus> status = await [
    Permission.notification,
  ].request();

  for (var entry in status.entries) {
    if (entry.value.isDenied) {
      await entry.key.request();
    }
  }
  return status;
}

Future<Map<Permission, PermissionStatus>> requestAudioPermissions() async {
  Map<Permission, PermissionStatus> status = await [
    Permission.audio,
    Permission.bluetooth,
    Permission.bluetoothConnect,
  ].request();

  for (var entry in status.entries) {
    if (entry.value.isDenied) {
      await entry.key.request();
    }
  }
  return status;
}

Future<Map<Permission, PermissionStatus>> requestLocationPermissions() async {
  Map<Permission, PermissionStatus> status = await [
    Permission.location, // ACCESS_FINE_LOCATION (or ACCESS_COARSE_LOCATION)
    Permission.locationWhenInUse,
    // Permission.locationAlways, // ACCESS_BACKGROUND_LOCATION
  ].request();

  for (var entry in status.entries) {
    if (entry.value.isDenied) {
      await entry.key.request();
    }
  }
  return status;
}

// ignore: non_constant_identifier_names
Future<Position?> locationPermission_info() async {
  late Position? position;
  Map<Permission, PermissionStatus> status = await requestLocationPermissions();

  status.forEach((permission, permissionStatus) {
    print("$permission permission status: $permissionStatus");
  });
  if (status[Permission.location] == PermissionStatus.granted ||
          status[Permission.locationWhenInUse] == PermissionStatus.granted
      // || status[Permission.locationAlways] == PermissionStatus.granted
      ) {
    position = await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high));
  } else {
    position = await Geolocator.getLastKnownPosition();
  }
  return position;
}

void setStoreLocationData() async {
  Position? position = await locationPermission_info();
  try {
    if (position != null) {
      await setStringData(AppConstants.currentLatitude, "${position.latitude}");
      await setStringData(
          AppConstants.currentLongitude, "${position.longitude}");
    }
  } catch (e) {
    print("error ===> $e");
  }
}
