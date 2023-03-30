library iridescent_color;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iridescent_color/routes/conversions_route.dart';
import 'package:motion_sensors/motion_sensors.dart';

class IridescentColor {
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  double _absoluteOrientationValue = 0;
  double _absoluteOrientationValueFixedRainbow = 0;
  double _absoluteOrientationValueFixedCustom = 0;

  ///
  void init(Function() callback) {
    motionSensors.absoluteOrientationUpdateInterval =
        Duration.microsecondsPerSecond ~/ 60;

    _streamSubscriptions.add(
      motionSensors.absoluteOrientation.listen(
        (AbsoluteOrientationEvent absoluteOrientationEvent) {
          _absoluteOrientationValue = absoluteOrientationEvent.pitch +
              absoluteOrientationEvent.roll +
              absoluteOrientationEvent.yaw;
          callback();
        },
      ),
    );
  }

  ///
  void dispose() {
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  ///
  Color rainbow({
    bool lockColor = false,
    double alpha = 1,
    double saturation = 1,
    double lightness = 0.5,
  }) {
    double deg;

    if (lockColor) {
      deg = rad2deg(_absoluteOrientationValueFixedRainbow);
    } else {
      _absoluteOrientationValueFixedRainbow = _absoluteOrientationValue;

      deg = rad2deg(_absoluteOrientationValue);
    }

    return deg2Color(
      alpha,
      deg,
      saturation,
      lightness,
    );
  }

  ///
  Color custom({
    required List<Color> colorList,
    bool lockColor = false,
  }) {
    Color color = colorList.first;

    double deg;

    double separationValue = 360 / colorList.length;

    if (lockColor) {
      deg = rad2deg360(_absoluteOrientationValueFixedCustom);
    } else {
      _absoluteOrientationValueFixedCustom = _absoluteOrientationValue;

      deg = rad2deg360(_absoluteOrientationValue) * colorList.length;
    }

    colorList.asMap().forEach((index, value) {
      if (deg >= separationValue * (index) &&
          deg < separationValue * (index + 1)) {
        color = value;
      }
    });

    return color;
  }
}
