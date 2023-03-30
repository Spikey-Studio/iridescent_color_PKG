import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iridescent_color/iridescent_color.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "IridescentColor Demo",
      home: IridescentColorDemo(),
    );
  }
}

class IridescentColorDemo extends StatefulWidget {
  const IridescentColorDemo({super.key});

  @override
  State<IridescentColorDemo> createState() => _IridescentColorDemoState();
}

class _IridescentColorDemoState extends State<IridescentColorDemo> {
  IridescentColor iridescentColor = IridescentColor();
  Color iridescentColorRainbow = Colors.transparent; //rainbow standby color
  Color iridescentColorCustom = Colors.transparent; //custom standby color

  bool iridescentColorRainbowLock = false;
  bool iridescentColorCustomLock = false;

  ///
  @override
  void initState() {
    super.initState();
    iridescentColor.init(
      () => setState(
        () {
          iridescentColorRainbow = iridescentColor.rainbow(
            lockColor: iridescentColorRainbowLock,
          );
          iridescentColorCustom = iridescentColor.custom(
            colorList: [
              Colors.white,
              Colors.red,
              Colors.green,
              Colors.blue,
            ],
            lockColor: iridescentColorCustomLock,
          );
        },
      ),
    );
  }

  ///
  @override
  void dispose() {
    super.dispose();
    iridescentColor.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "RAINBOW",
                  style: TextStyle(
                    color: iridescentColorRainbow,
                    fontWeight: FontWeight.bold,
                    fontSize: 64,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() =>
                      iridescentColorRainbowLock = !iridescentColorRainbowLock),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: iridescentColorRainbow,
                  ),
                  child: const Text("LOCK RAINBOW"),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "CUSTOM",
                  style: TextStyle(
                    color: iridescentColorCustom,
                    fontWeight: FontWeight.bold,
                    fontSize: 64,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => setState(() =>
                      iridescentColorCustomLock = !iridescentColorCustomLock),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: iridescentColorCustom,
                  ),
                  child: const Text("LOCK CUSTOM"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
