import 'package:flutter/cupertino.dart';

class WrapBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Axis? direction;
  final WrapAlignment? alignment;
  final double? spacing;
  final double? runSpacing;
  final WrapAlignment? runAlignment;
  final WrapCrossAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final Clip? clipBehavior;
  const WrapBuilder(
      {super.key,
      required this.itemBuilder,
      required this.itemCount,
      this.direction,
      this.alignment,
      this.spacing,
      this.runSpacing,
      this.runAlignment,
      this.crossAxisAlignment,
      this.textDirection,
      this.verticalDirection,
      this.clipBehavior});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: direction ?? Axis.horizontal,
      alignment: alignment ?? WrapAlignment.start,
      spacing: spacing ?? 10,
      runSpacing: runSpacing ?? 10,
      runAlignment: runAlignment ?? WrapAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? WrapCrossAlignment.start,
      textDirection: textDirection ?? TextDirection.ltr,
      verticalDirection: verticalDirection ?? VerticalDirection.down,
      clipBehavior: clipBehavior ?? Clip.none,
      children: List.generate(itemCount, (index) => itemBuilder(context, index)),
    );
  }
}

// typedef ValueWidgetBuilder<T> = Widget Function(T value);

// class WrapBuilder extends StatelessWidget {
//   final double itemWidth;
//   final List items;
//   final ValueWidgetBuilder itemBuilder;

//   const WrapBuilder({Key? key, required this.itemWidth, required this.items, required this.itemBuilder}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       var cardsPerRow = max(1, constraints.maxWidth ~/ itemWidth);
//       return ListView.builder(
//         shrinkWrap: true,
//         controller: ScrollController(),
//         itemCount: (items.length / cardsPerRow).ceil(),
//         itemBuilder: (BuildContext context, int index) {
//           var rowItems = items.sublist(cardsPerRow * index, min(cardsPerRow * (index + 1), items.length));
//           return Row(children: [for (final item in rowItems) Gap( itemWidth, child: itemBuilder(item))]);
//         },
//       );
//     });
//   }
// }
