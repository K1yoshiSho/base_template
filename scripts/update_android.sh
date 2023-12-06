#!/bin/bash

# cd $PROJECT_PATH
flutter clean
flutter pub get
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
