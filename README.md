# iridescent_color

is a package that uses device movements to calculate a change of customizable colors.

## ⭐ Features

- 🛠️ Custom - It uses a customized color palette to simulate the effect.

- 🌈 Raimbow - It uses the entire color spectrum to simulate the effect.

## ⚙️ Getting started

Install the package in your project via command

```cmd
flutter pub add iridescent_color
```

Or, add to pubspec.yaml file

```dart
dependencies:
  iridescent_color: ^0.1.0
```

## ⚡ Basic usage

Import the package in your code

```dart
import 'package:iridescent_color/iridescent_color.dart';
```

Use it this way [(Example)](https://pub.dev/packages/iridescent_color/example)

```dart
/// Create the library instance
IridescentColor iridescentColor = IridescentColor();
Color iridescentColorRainbow = Colors.transparent; //Set default/initial color here
Color iridescentColorCustom = Colors.transparent; //Set default/initial color here

/// In initState
@override
void initState() {
  super.initState();
  iridescentColor.init(
    () => setState(
      () {
        iridescentColorRainbow = iridescentColor.rainbow();
        iridescentColorCustom = iridescentColor.custom(
          colorList: [
            Colors.white,
            Colors.red,
            Colors.green,
            Colors.blue,
          ],
        );
      },
    ),
  );
}

/// In dispose
@override
void dispose() {
  super.dispose();
  iridescentColor.dispose();
}
```
