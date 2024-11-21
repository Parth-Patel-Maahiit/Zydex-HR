// ignore_for_file: avoid_print

import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class CommonMixpanel {
  static late Mixpanel? _mixpanel;

  static Future<void> initMixpanel() async {
    print("Initializing Mixpanel");
    _mixpanel = await Mixpanel.init("da722778716bf9a824f7d295669398d6",
        trackAutomaticEvents: false);
    print("Mixpanel Initialized");
  }

  static void trackScreen(String text, {Map<String, dynamic>? properties}) {
    if (_mixpanel != null) {
      print("Tracking event: $text");
      _mixpanel!.track(text, properties: properties);
    } else {
      print("Mixpanel not initialized. Call initMixpanel first.");
    }
  }

  static Future<void> identifyer(String text) async {
    if (_mixpanel != null) {
      print("Identify event: $text");
      _mixpanel!.identify(text);
    } else {
      print("Mixpanel not initialized. Call initMixpanel first.");
    }
  }

  static void setProperties(String key, dynamic value) {
    if (_mixpanel != null) {
      print("set event key: $key and Properties: $value");
      _mixpanel!.getPeople().set(key, value);
    } else {
      print("Mixpanel not initialized. Call initMixpanel first.");
    }
  }

  static void resetMixpanel() {
    if (_mixpanel != null) {
      print("Mixpanel is reset or logout");
      _mixpanel!.reset();
    } else {
      print("Mixpanel not initialized. Call initMixpanel first.");
    }
  }
}
