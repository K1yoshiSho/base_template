#!/bin/bash

# cd $PROJECT_PATH
flutter clean
flutter pub get
cd ios
pod deintegrate
pod repo update
pod update
cd ..
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter gen-l10n
cd ios
pod install
