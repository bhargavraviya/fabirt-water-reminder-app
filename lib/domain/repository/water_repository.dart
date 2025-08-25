import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:waterreminder/constant/constant.dart';
import 'package:waterreminder/data/platform/platform_messenger.dart';
import 'package:waterreminder/domain/model/water_settings.dart';

class WaterRepository {
  WaterRepository() {
    PlatformMessenger.setMethodCallHandler((call) {
      switch (call.method) {
        case Constant.methodWaterSettingsChanged:
          _waterSettings.add(WaterSettings.fromMap(call.arguments));
          break;
        default:
          break;
      }
      return Future.value(null);
    });
  }

  final _waterSettings = BehaviorSubject<WaterSettings>();

  Stream<WaterSettings> get waterSettings => _waterSettings.stream;

  void drinkWater(int milliliters) {
    PlatformMessenger.invokeMethod(Constant.methodDrinkWater, milliliters);
  }

  void changeAlarmEnabled(bool enabled) {
    PlatformMessenger.invokeMethod(
        Constant.methodChangeNotificationEnabled, enabled);
  }

  void subscribeToDataStore() async {
  try {
     PlatformMessenger.invokeMethod(Constant.methodSubscribeToDataStore);
  } on MissingPluginException catch (e) {
    // Plugin not implemented on current platform (e.g., during testing or dev)
    debugPrint("Platform method not implemented: ${e.message}");
  } catch (e, stack) {
    // Log any other unexpected error
    debugPrint("Unexpected error: $e\n$stack");
  }
  }

  void setRecommendedMilliliters(int milliliters) {
    PlatformMessenger.invokeMethod(
        Constant.methodSetRecommendedMilliliters, milliliters);
  }

  void clearDataStore() {
    PlatformMessenger.invokeMethod(Constant.methodClearDataStore);
  }

  void close() {
    _waterSettings.close();
  }
}
