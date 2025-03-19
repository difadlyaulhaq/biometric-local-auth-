# Biometric Authentication in Flutter

## Description
This Flutter project implements biometric authentication (fingerprint or face recognition) using the `local_auth` package. It allows users to log in using either their username & password or biometrics.

## Features
- Login with username & password
- Biometric authentication (Fingerprint/Face ID)
- Secure navigation to the home page upon successful authentication

## Installation
### 1. Clone the Repository
```sh
git clone https://github.com/yourusername/biometric_auth_flutter.git
cd biometric_auth_flutter
```

### 2. Install Dependencies
```sh
flutter pub get
```

### 3. Run the App
```sh
flutter run
```

## Dependencies
Add the following dependency to your `pubspec.yaml` file:
```yaml
dependencies:
  flutter:
    sdk: flutter
  local_auth: ^2.1.6
```

## Configuration
### **Android**
1. Edit `android/app/src/main/AndroidManifest.xml` and add:
```xml
<uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<uses-permission android:name="android.permission.USE_FINGERPRINT"/>
```
2. Change `MainActivity.kt` to extend `FlutterFragmentActivity`:
```kotlin
package com.example.biometric

import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
}
```

### **iOS**
1. Edit `ios/Runner/Info.plist` and add:
```xml
<key>NSFaceIDUsageDescription</key>
<string>We use Face ID to authenticate you</string>
```
2. Run the following command:
```sh
cd ios && pod install
```

## Usage
1. Run the app on a physical device (biometrics may not work on emulators).
2. Enter the username and password (`admin` / `admin`) or use the fingerprint/Face ID button.
3. If authentication succeeds, you will be navigated to the home page.

## Troubleshooting
- If you get `PlatformException(no fragment activity local auth plugin)`, ensure `MainActivity` extends `FlutterFragmentActivity`.
- Run `flutter clean` and restart the app if biometric authentication does not work.

## License
This project is licensed under the MIT License.

