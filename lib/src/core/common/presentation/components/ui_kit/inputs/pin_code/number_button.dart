import 'package:base/src/core/common/exports/main_export.dart';

class NumberButton extends StatelessWidget {
  final String number;
  final Function() onTap;
  const NumberButton({super.key, required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () => onTap(),
      text: number,
      options: ButtonOptions(
        width: 70,
        height: 70,
        splashColor: AppPalette.splash,
        padding: EdgeInsets.zero,
        iconPadding: EdgeInsets.zero,
        color: const Color(0xFFF8FAFF),
        textStyle: AppTextStyle.b3(context).copyWith(fontSize: 18),
        elevation: 0,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
