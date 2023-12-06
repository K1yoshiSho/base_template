import 'package:base/src/core/common/exports/main_export.dart';

final class AppDialogs {
  const AppDialogs();

  static Future<void> dismiss() async {
    EasyLoading.dismiss();
  }

  static Future<bool> questionDialog({required BuildContext context, required String title}) async {
    bool? canExit;

    await showDialog(
      context: context,
      barrierColor: AppPalette.white.withOpacity(0.3),
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.l10n.wait),
          content: Text(title),
          backgroundColor: context.theme.scaffoldBackgroundColor,
          titleTextStyle: AppTextStyle.h2(context),
          contentTextStyle: AppTextStyle.b3(context).copyWith(
            color: AppPalette.gray700,
          ),
          actions: [
            AppButton(
              width: 90,
              height: 40,
              isOutline: true,
              hasBorder: true,
              onPressed: () {
                canExit = true;
                Navigator.of(context).pop();
              },
              text: context.l10n.yes.capitalize(),
            ),
            AppButton(
              width: 90,
              height: 40,
              onPressed: () {
                canExit = false;
                Navigator.of(context).pop();
              },
              text: context.l10n.no.capitalize(),
            ),
          ],
        );
      },
    );

    return Future.value(canExit ?? false);
  }

  static void showError(BuildContext context, {String? title}) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1500)
      ..indicatorType = EasyLoadingIndicatorType.dualRing
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45
      ..radius = 16
      ..textStyle = AppTextStyle.b3(context)
      ..progressColor = AppPalette.primaryColor
      ..backgroundColor = AppPalette.darkGrey
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = context.theme.appColors.scaffoldBackground
      ..userInteractions = true
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..dismissOnTap = false;
    EasyLoading.dismiss();
    EasyLoading.showError(
      title ?? context.l10n.error,
      duration: const Duration(seconds: 2),
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
    );
  }

  static void showToast(BuildContext context, {String? title}) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1500)
      ..indicatorType = EasyLoadingIndicatorType.dualRing
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45
      ..radius = 16
      ..textStyle = AppTextStyle.b3(context)
      ..progressColor = AppPalette.primaryColor
      ..backgroundColor = AppPalette.darkGrey
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = context.theme.appColors.scaffoldBackground
      ..userInteractions = true
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..dismissOnTap = false;
    EasyLoading.dismiss();
    EasyLoading.showToast(
      title ?? context.l10n.requestSuccess,
      duration: const Duration(seconds: 1),
      maskType: EasyLoadingMaskType.clear,
      toastPosition: EasyLoadingToastPosition.bottom,
      dismissOnTap: true,
    );
  }

  static void showSuccessToast(BuildContext context, {String? title, Function()? then}) async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1500)
      ..indicatorType = EasyLoadingIndicatorType.dualRing
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45
      ..radius = 16
      ..textStyle = AppTextStyle.b3(context)
      ..progressColor = AppPalette.primaryColor
      ..backgroundColor = AppPalette.green
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = context.theme.appColors.scaffoldBackground
      ..userInteractions = true
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..dismissOnTap = false;
    EasyLoading.dismiss();
    EasyLoading.showToast(
      title ?? context.l10n.requestSuccess,
      duration: const Duration(seconds: 1),
      maskType: EasyLoadingMaskType.clear,
      toastPosition: EasyLoadingToastPosition.bottom,
      dismissOnTap: true,
    ).then((value) => then?.call());
  }

  static void showErrorToast(BuildContext context, {String? title}) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1500)
      ..indicatorType = EasyLoadingIndicatorType.dualRing
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45
      ..radius = 16
      ..textStyle = AppTextStyle.b3(context)
      ..progressColor = AppPalette.primaryColor
      ..backgroundColor = AppPalette.danger
      ..indicatorColor = AppPalette.primaryColor
      ..textColor = context.theme.appColors.text
      ..maskColor = context.theme.appColors.scaffoldBackground
      ..userInteractions = true
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..dismissOnTap = false;
    EasyLoading.dismiss();
    EasyLoading.showToast(
      title ?? context.l10n.error,
      duration: const Duration(seconds: 1),
      maskType: EasyLoadingMaskType.clear,
      toastPosition: EasyLoadingToastPosition.bottom,
      dismissOnTap: true,
    );
  }

  static void showLoader(BuildContext context, {String? title}) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1500)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45
      ..radius = 16
      ..textStyle = AppTextStyle.b3(context).copyWith(color: Colors.white)
      ..progressColor = AppPalette.primaryColor
      ..backgroundColor = AppPalette.darkGrey
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = context.theme.appColors.scaffoldBackground
      ..userInteractions = false
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..dismissOnTap = false;
    EasyLoading.dismiss();
    EasyLoading.show(
      status: title ?? context.l10n.loading,
      indicator: const DotsLoader(),
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );
  }

  static void showSuccess(BuildContext context, {String? title}) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 1500)
      ..indicatorType = EasyLoadingIndicatorType.dualRing
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45
      ..radius = 16
      ..textStyle = AppTextStyle.b3(context)
      ..progressColor = AppPalette.primaryColor
      ..backgroundColor = AppPalette.darkGrey
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = context.theme.appColors.scaffoldBackground
      ..userInteractions = true
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..dismissOnTap = false;
    EasyLoading.dismiss();
    EasyLoading.showSuccess(
      title ?? context.l10n.requestSuccess,
      duration: const Duration(seconds: 1),
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
    );
  }
}
