package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import finaldev.motion_sensors.MotionSensorsPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    MotionSensorsPlugin.registerWith(registry.registrarFor("finaldev.motion_sensors.MotionSensorsPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
