import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/common/presentation/components/builders/row_builder.dart';
import 'package:photo_view_x/photo_view_x.dart';

class ImageSliderScreen extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  static const String name = 'Image Slider';
  static const String routePath = '/image_slider';

  const ImageSliderScreen({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  static void navigateTo({
    required BuildContext context,
    required int initialIndex,
    required List<String> images,
  }) {
    context.pushNamed(name, extra: {
      ScreenExtras.initialIndex: initialIndex,
      ScreenExtras.images: images,
    });
  }

  @override
  State<ImageSliderScreen> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSliderScreen> {
  final SpacingPageController _pageController = SpacingPageController(viewportFraction: 1);

  int _current = 0;

  final defaultUrl = 'https://waterparkworld.ru/wp-content/uploads/2021/10/F370.jpg';

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(
        widget.initialIndex,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.black,
      appBar: const PrimaryAppBar(title: ""),
      body: Stack(
        children: [
          SizedBox(
            height: context.height,
            width: double.infinity,
            child: PhotoPageView(
              controller: _pageController,
              pageSnapping: true,
              padEnds: false,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return PhotoView(
                  tapEnabled: false,
                  onDismiss: () {
                    context.pop();
                  },
                  child: FractionallySizedBox(
                    widthFactor: 1 / 1.02,
                    child: Image.network(
                      widget.images[index],
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: DotsLoader(),
                        );
                      },
                      // fit: BoxFit.scaleDown,
                    ),
                  ),
                );
              },
            ),
          ),
          (widget.images.length > 1)
              ? Align(
                  alignment: const Alignment(0, 0.9),
                  child: _CustomDots(
                    images: widget.images,
                    current: _current,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _CustomDots extends StatelessWidget {
  final List<String> images;
  final int current;

  const _CustomDots({required this.images, required this.current});

  @override
  Widget build(BuildContext context) {
    const dotWidthCurrent = 25.0;
    const dotWidthNormal = 10.0;
    const dotHeight = 6.0;
    const dotMargin = EdgeInsets.all(2.5);
    const borderRadius = BorderRadius.all(Radius.circular(2.5));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RowBuilder(
          itemCount: images.length,
          mainAxisAlignment: MainAxisAlignment.center,
          itemBuilder: (context, index) {
            final isSelected = index == current;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSelected ? dotWidthCurrent : dotWidthNormal,
              height: dotHeight,
              margin: dotMargin,
              decoration: BoxDecoration(
                color: isSelected ? AppPalette.white : AppPalette.lightGrey,
                borderRadius: borderRadius,
              ),
            );
          },
        ),
      ],
    );
  }
}
