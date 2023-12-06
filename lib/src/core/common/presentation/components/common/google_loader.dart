// import 'package:base/src/core/common/exports/main_export.dart';

// class DotsLoader extends StatefulWidget {
//   const DotsLoader({super.key});

//   @override
//   _GoogleStyleProgressIndicatorState createState() => _GoogleStyleProgressIndicatorState();
// }

// class _GoogleStyleProgressIndicatorState extends State<DotsLoader> with TickerProviderStateMixin {
//   late AnimationController _rotationController;
//   Timer? _colorChangeTimer;
//   int _currentColorIndex = 0;
//   final List<Color> _colors = [Colors.blue, Colors.red, Colors.yellow, Colors.green];

//   @override
//   void initState() {
//     super.initState();

//     _rotationController = AnimationController(
//       duration: const Duration(milliseconds: 1333),
//       vsync: this,
//     )..repeat();

//     _colorChangeTimer = Timer.periodic(const Duration(milliseconds: 1333), (_) {
//       setState(() {
//         _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CircularProgressIndicator(
//       valueColor: AlwaysStoppedAnimation(_colors[_currentColorIndex]),
//       strokeWidth: 5.0,
//     );
//   }

//   @override
//   void dispose() {
//     _rotationController.dispose();
//     _colorChangeTimer?.cancel();
//     super.dispose();
//   }
// }

// // class DotsLoader extends StatefulWidget {
// //   final List<Color> colors;
// //   final double size;
// //   final double strokeWidth;

//   // const DotsLoader({super.key, this.colors = AppPalette.mainColors, this.size = 35, this.strokeWidth = 4});

// //   @override
// //   State<DotsLoader> createState() => _AppLoaderState();
// // }

// // class _AppLoaderState extends State<DotsLoader> with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   int _colorIndex = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       duration: const Duration(milliseconds: 1333),
// //       vsync: this,
// //     );

// //     _controller.addStatusListener((status) {
// //       if (status == AnimationStatus.completed) {
// //         setState(() {
// //           _colorIndex = (_colorIndex + 1) % widget.colors.length;
// //         });
// //         _controller.reset();
// //         _controller.forward();
// //       }
// //     });

// //     _controller.forward();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return RepaintBoundary(
// //       child: SizedBox(
// //         width: widget.size,
// //         height: widget.size,
// //         child: CircularProgressIndicator(
// //           valueColor: AlwaysStoppedAnimation(widget.colors[_colorIndex]),
// //           strokeWidth: widget.strokeWidth,
// //           strokeCap: StrokeCap.round,
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// // }
