import 'package:base/src/core/common/exports/main_export.dart';

class DotsLoader extends StatefulWidget {
  final Duration duration;
  final double size;

  const DotsLoader({
    super.key,
    this.duration = const Duration(milliseconds: 800),
    this.size = 10,
  });

  @override
  DotsLoaderState createState() => DotsLoaderState();
}

class DotsLoaderState extends State<DotsLoader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<Color> kColors = AppPalette.mainColors;
  int _topColorIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          _topColorIndex = (_topColorIndex + 1) % kColors.length;
        });
      }
    });

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the bounding box size based on the given size
    final boxSize = (widget.size * 2);

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                  width: boxSize,
                  height: boxSize,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      BouncingBall(
                        shapeColor: kColors[(_topColorIndex + 1) % kColors.length],
                        size: widget.size,
                        yOffset: -widget.size * _animation.value,
                      ),
                      BouncingBall(
                        shapeColor: kColors[(_topColorIndex + 2) % kColors.length],
                        size: widget.size,
                        xOffset: widget.size * _animation.value,
                      ),
                      BouncingBall(
                        shapeColor: kColors[(_topColorIndex + 3) % kColors.length],
                        size: widget.size,
                        yOffset: widget.size * _animation.value,
                      ),
                      BouncingBall(
                        shapeColor: kColors[_topColorIndex],
                        size: widget.size,
                        xOffset: -widget.size * _animation.value,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BouncingBall extends StatelessWidget {
  final Color shapeColor;
  final double xOffset;
  final double yOffset;
  final double size;

  const BouncingBall({
    super.key,
    required this.shapeColor,
    this.xOffset = 0,
    this.yOffset = 0,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the maximum allowed offsets to keep the ball within the bounding box
    final maxXOffset = (size * 1.5) - (size / 2);
    final maxYOffset = (size * 1.5) - (size / 2);

    return Transform.translate(
      offset: Offset(
        xOffset.clamp(-maxXOffset, maxXOffset),
        yOffset.clamp(-maxYOffset, maxYOffset),
      ),
      child: AnimatedContainer(
        width: size,
        duration: const Duration(milliseconds: 300),
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: shapeColor,
        ),
      ),
    );
  }
}
