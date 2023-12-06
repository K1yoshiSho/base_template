# <img src="assets/icons/ic_launcher.png" width="23"/> Base project

## Getting Started 🚀

This project contains 2 flavors:

- development
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor dev --target lib/main_dev.dart

# Production
$ flutter run --flavor prod --target lib/main.dart

# Build APK:
$ flutter build apk  --flavor prod -t lib/main.dart

# Split APK build:
$ flutter build apk --no-shrink --split-per-abi --flavor prod -t lib/main.dart

# Rebuild generated files:
$ dart run build_runner build --delete-conflicting-outputs

# Gen L10n:
$ flutter gen-l10n

# Get permission for sh scripts:
$ chmod a+x update_android.sh

# Update iOS and Android:
$ ./update_android.sh
$ ./update_ios.sh

# Init Firebase:
$ ./init_firebase.sh
```

_\*Base project works on iOS, Android._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Features 📍

<!-- 1. [**Auth**](docs/auth.md)
2. [**Home**](docs/home.md)  
   Sub features:  
   - [**SED**](docs/sed.md) - EDM feature.
      - [**Document**](docs/document.md) - document screen feature.
      - [**Create document**](docs/create_document.md) - create document feature.
   - [**Production calendar**](docs/production_calendar.md) - feature for Production calendar.
   - [**Attendance**](docs/attendance.md) - feature for attendance.
3. [**Profile**](docs/profile.md)  
   Sub features:  
   - [**My documents**](docs/my_documents.md) - current user's electronic documents.
   - [**Personal card**](docs/personal_cards.md) - feature for Personal card.
   - [**Settings**](docs/settings.md) - settings.
   - [**Tech support**](docs/tech_support.md) - tech support. -->

---

## Update project for deploying: 🔄

1. **Android**:
   Make sure that the versions match the value of local properties: in pubspec.yaml - version:
   For example `1.9.3+2013` '1.9.3' is the project version, '2013' is the build version.
   Inside `android/local.properties`:   
   `flutter.versionName=1.9.3` - project version.  
   `flutter.versionCode=2013` - build version.

   After that, run the file `update_android.sh`. After successfully launching the file, right-click on the `android` folder and click on `Open in Android Studio`. Next, `Build - Generate Signed Bundle / APK`.

2. **iOS**:
   Run the file `update_ios.sh `. After successfully launching the file, right-click on the `ios` folder and click on `Open in XCode`. Next in the `Product - Clean build `folder`  and  `Build`.  

---

## Overall architecture 🌀

For the the state management [**BLoC**](https://pub.dev/documentation/flutter_bloc/latest/) and [**Provider**](https://pub.dev/documentation/provider/latest/) was used. Each feature has 4 folders.&nbsp;

1. **bloc** - folder contains the event, state and bloc classes.
2. **resource** - contains `repository` class, which connects bloc with the api's. Repository receives the event and emits state, and can make api calls if needed.
3. **presentation** - contains all ui related code. It may contain two folders: `screens` and `components`.
4. **models** - It contains models for objects for feature.

### ❓ How to add new features?

To add new features follow steps:&nbsp;

1. Add a new folder within the **features** folder with the some custom name.
2. Create folders **bloc**, **resource**, **presentation** and **models**.
3. Create folder **screens**, **components** in a folder **presentation**.
4. Create a new file in **screens** folder.
5. For screen's file add some static fields: (example) &nbsp;

  ```dart
  static const String name = "Settings"; // Name for main screen file
  static const String routeName = "settings"; // Name for current route
  static const String routePath = "/home/settings"; // All path for current route
  ```

6. in `lib/src/router/navigation.dart` create a route and in the `index.dart` file add an export for the main screen file.

---

## Services and persistent

### Services

There are several services that can be accessed globally or with statics methods

1. **di** folder - contains service locators (get_it). &nbsp;
- `get_it.dart` -  Service Locator for Dart and Flutter projects. [Docs](https://pub.dev/documentation/get_it/latest/).
2. **geo** folder - contains all services for geolocation (background, etc.).&nbsp;
3. **gms** folder contains all services for Google Mobile Services.&nbsp;
- `analytics.dart` - contains all methods for **Firebase Analytics**.
- `google_notifications.dart` - contains all methods for **Firebase Cloud Messaging**.
4. **hms** folder - contains all services for Huawei Mobile Services.&nbsp;
- `huawei_notifications.dart` - contains all methods for **HMS Push Kit**.
6. **http** folder - contains the necessary files for working with http requests.&nbsp;
- `http_query.dart` - contains common methods for requests `(GET, POST, DELETE, PUT, PATCH)`.
- `error_interceptor.dart` - contains a common [**interceptor**](https://dhruvnakum.xyz/networking-in-flutter-interceptors) for processing responses from the request.
- `talker.dart` - error handler and logger for dart and flutter apps.
- **isolate** folder contains common http_query and interceptor files for [**Isolate**](https://plugfox.dev/mastering-isolates/) requests.\
7. **local_storage** folder - contains all methods for local persistance `(isar, secure_storage, shared_preferences)`.
8. `app_model.dart` - contains a class that is needed to initialize and dispose fields in the main screen (in feature).

### Persistent

Packages such as: `shared_preferences, secure_storage, (drift)` are still used to store any data.

- To save **settings, configs and other things** — `shared_preferences`
- To save **important** data, tokens — `flutter_secure_storage`
- To save a **huge amount** of data — `sqlite (drift)` *(Not used in the project yet)*

To use shared_preferences:&nbsp;
You can find more details here *(getBool, getString, etc.)*: [click](https://pub.dev/packages/shared_preferences)
1. In `services/local_storage/preferences.dart` we create a key for our field. Example:&nbsp;

  ```dart
   class Preferences {
      static const String kLocale = 'locale';
   }
  ```

2. In `services/local_storage/shared_preferences.dart` inside `SharedPreferenceHelper` we need to add get and set method for our field. Example:&nbsp;

  ```dart
  Locale get locale => Locale(_sharedPreference.getString(Preferences.kLocale) ?? 'ru');
  Future setLocale(Locale value) async => await _sharedPreference.setString(Preferences.kLocale, value.languageCode);
  ```
&nbsp;
To store an object *(model)*:
&nbsp;

  ```dart
  CurrentUserData get currentUser {
    Map<String, dynamic> jsonObject = json.decode(_sharedPreference.getString(Preferences.kCurrentUser) ?? "");
    return CurrentUserData.fromJson(jsonObject);
  }

  Future setCurrentUser(CurrentUserData value) async => await _sharedPreference.setString(Preferences.kCurrentUser, json.encode(value.toJson()));
  ```

&nbsp;
***A [Drift](https://pub.dev/packages/drift ) splint will be added later, while it is not used in the project.***

&nbsp;
***A [Isar](https://pub.dev/packages/isar ) splint will be added later, while it is not used in the project.***

<br>

---

## Constants and Theme

The whole theme in the project is based on three files. The source is a design project in [**Figma**](https://clck.ru/34ZVnR). Do not take information from the ceiling, only from the design! :)
- `app_colors.dart` - contains all the colors in the project for quick access to them.
- `app_styles.dart` - contains different `Style` properties. *(example: body Medium 400).*  
Each of them can be edited when used via `.copyWith()`. Example:  
```dart
textStyle: AppTextStyle.titleMedium600(context).copyWith(
        color: obsureText ? AppPalette.inactiveColor : AppPalette.primaryColor,
      ),
```
- `app_theme.dart` - contains two `ThemeData` fields. Accordingly, LightTheme for a light theme, DarkTheme for a dark theme.
- `app_images.dart` - contains all images in app.
- `workspace_icons.dart` - contains all custom icons.

<br>

---

## Common

The path `lib/src/common` contains 3 folders:

- **components** - common `components` and `widgets` for all features.
- **models** - common `models` *(object)* for all features.
- **utils** - contains common `enums`, string `keys` and small `methods`.
- **provider** folder - contains all providers in the application. For example, dynamic change localization and theme, etc.
- **screens** - contains common `screens` in project.

- Get current location with query **(GoRouter)**:
    ```dart
    final String location = GoRouterState.of(context).uri.toString();
    final Map<String, String> queryParameters = GoRouterState.of(context).uri.queryParameters;
    final Map<String, List<String>> queryParametersAll = GoRouterState.of(context).uri.queryParametersAll;
    ```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "ru"
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "ru",
    "settings": "Настройки"
}
```

3. Use the new string

```dart
import 'package:workspace/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n!;
  return Text(l10n.settings);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>ru</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── app_en.arb
│   └── app_ru.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "settings": "Settings"
}
```

`app_ru.arb`

```arb
{
    "@@locale": "ru",
    "settings": "Настройки"
}
```

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
