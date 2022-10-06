//* FLUTTER COMMANDS
//* flutter pub get
//* flutter pub get add url_launcher
//* flutter clean

//! FLUTTER lAUNCHER ICON
//!/! flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons.yaml

//* FLUTTER SPLASH SCREEN
//* flutter pub run flutter_native_splash:create

//? HIVE COMMANDS
//? flutter packages pub run build_runner build watch --delete-conflicting-outputs

// TODO CONNECT TO TECNO SPARK5 OVER WIFI

// TODO //  C:\platform-tools\adb tcpip 5555

// TODO // C:\platform-tools\adb connect 192.168.43.51:5555

//? FLUTTER AUTOMATION - ANDROID - SIGN
//!   flutter pub pub run flutter_automation --android-sign


//? AppBundle/Apk realease
//!   flutter build apk --release
//!    flutter build appbundle --target-platform
//!   flutter build appbundle --target-platform android-arm,android-arm64,android-x64

//* NULL SAFETY
//* To check if packages are migratable
//? flutter pub outdated --mode=null-safety
//? flutter pub upgrade --null-safety --dry-run


//!   keytool -genkey -v -keystore 
//!  c:\Users\Felix\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload

//! keytool -genkey -v -keystore c:\Users\Felix\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload


//? SHA1 SH2
// keytool -list -v \ 
// -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore

// flutter run lib/main.dart