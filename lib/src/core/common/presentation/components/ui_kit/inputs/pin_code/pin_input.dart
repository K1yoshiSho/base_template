import 'package:base/src/core/common/exports/main_export.dart';

class AppPinInput extends StatefulWidget {
  final TextEditingController controller;
  final Function() checkPin;
  final int codeLength;

  const AppPinInput({
    Key? key,
    required this.controller,
    required this.checkPin,
    this.codeLength = 4,
  }) : super(key: key);

  @override
  State<AppPinInput> createState() => _AppPinInputState();
}

class _AppPinInputState extends State<AppPinInput> {
  final List<TextEditingController> controllers = [];
  final List<FocusNode> focuses = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.codeLength; i++) {
      controllers.add(TextEditingController());
      focuses.add(FocusNode());
    }
    controllers.last.addListener(() {
      String code = '';
      for (final element in controllers) {
        if (element.text.isEmpty) {
          return;
        }
        code += element.text;
      }
      setState(() {});
      widget.controller.text = code;
      widget.checkPin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.codeLength, (index) {
        return _buildSinglePinInput(index);
      }),
    );
  }

  Widget _buildSinglePinInput(int index) {
    final isLast = index == controllers.length - 1;

    return Expanded(
      child: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(focuses[index]);
        },
        child: Container(
          height: 56,
          alignment: Alignment.center,
          margin: isLast ? null : const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            border: Border.all(color: AppPalette.darkGrey, width: 1),
            shape: BoxShape.rectangle,
            borderRadius: _borderRadius(index),
          ),
          child: TextField(
            onTap: () {
              for (int i = 0; i < controllers.length; i++) {
                if (controllers[i].text.isEmpty) {
                  FocusScope.of(context).requestFocus(focuses[i]);
                  break;
                }
              }
            },
            maxLength: 4,
            showCursor: false,
            autofocus: index == 0 ? true : false,
            controller: controllers[index],
            focusNode: focuses[index],
            textAlign: TextAlign.center,
            cursorColor: Colors.transparent,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              semanticCounterText: "",
              counterText: "",
              isCollapsed: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.all(16),
            ),
            onChanged: (text) {
              if (text.isEmpty) {
                for (var element in controllers) {
                  element.clear();
                }
                FocusScope.of(context).requestFocus(focuses[0]);
                return;
              }
              if (isLast) {
                String code = '';
                for (final element in controllers) {
                  code += element.text;
                }
                widget.controller.text = code;
                widget.checkPin();
                return;
              } else {
                if (text.length > 1) {
                  controllers[index].text = text[0];
                  for (int i = index + 1; i < controllers.length && i < text.length; i++) {
                    controllers[i].text = text[i];
                    FocusScope.of(context).requestFocus(focuses[i]);
                  }
                }
                FocusScope.of(context).requestFocus(focuses[index + 1]);
              }
            },
            style: AppTextStyle.h1(context),
          ),
        ),
      ),
    );
  }

  BorderRadius? _borderRadius(int index) {
    const radius = Radius.circular(8);
    if (index == 0) {
      return const BorderRadius.only(topLeft: radius, bottomLeft: radius);
    }
    if (index == controllers.length - 1) {
      return const BorderRadius.only(topRight: radius, bottomRight: radius);
    }
    return null;
  }

  @override
  void dispose() {
    for (final element in controllers) {
      element.dispose();
    }
    super.dispose();
  }
}
