<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Bank Finder

a flutter package to find banks in a specific location latitude and longitude

## Features

- Find banks in a specific location
- Get bank details
- Get bank branches

## Getting started

### 1. Add permission to your AndroidManifest.xml file

```xml

    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.HIGH_SAMPLING_RATE_SENSORS" />
```

### 2. Add the dependency to your pubspec.yaml file

```yaml
dependencies:
  bank_finder: ^0.0.1
```

### 4. Import the package

```dart
import 'package:bank_finder/bank_finder.dart';
```

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information(Optional)

## Common issues

### Update your kotlin version in settings.gradle file (if kotlin version mismatch error occurs)

```gradle
 plugins {
    id "dev.flutter.flutter-plugin-loader" version "1.0.0"
    id "com.android.application" version "7.3.0" apply false
    id "org.jetbrains.kotlin.android" version "1.9.10" apply false
}
```

### in your build gradle file change all plugin compile sdk version to 34

```gradle
subprojects {
    afterEvaluate { project ->
        if (project.plugins.hasPlugin("com.android.application") ||
                project.plugins.hasPlugin("com.android.library")) {
            project.android {
                compileSdkVersion 34
                buildToolsVersion "34.0.0"
            }
        }
    }
}
```
