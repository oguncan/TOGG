import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class FirebaseAnalyticsUtil {
  static FirebaseAnalyticsUtil instance = FirebaseAnalyticsUtil();
  event(String event, {Map<String, Object?>? parameters}) {
    FirebaseAnalytics.instance.logEvent(name: event, parameters: parameters);
  }
}