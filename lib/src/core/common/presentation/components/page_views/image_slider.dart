import 'package:carousel_slider/carousel_slider.dart';
import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/common/presentation/screens/fullscreen_slider.dart';

class ImageSlider extends StatefulWidget {
  final CarouselController? pageController;
  final double? height;
  final List<String> images;
  final Function(int)? onTap;
  final bool showCounter;
  final bool showFullScreenImage;
  final bool autoPlay;

  const ImageSlider({
    super.key,
    required this.images,
    this.pageController,
    this.height,
    this.showCounter = true,
    this.showFullScreenImage = true,
    this.autoPlay = false,
    this.onTap,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController? _pageController;
  int _current = 0;

  final defaultUrl = 'https://waterparkworld.ru/wp-content/uploads/2021/10/F370.jpg';

  @override
  void initState() {
    super.initState();
    _pageController ??= widget.pageController;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pageController ??= CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height ?? 240,
          width: double.infinity,
          child: CarouselSlider.builder(
              carouselController: _pageController,
              itemCount: widget.images.length,
              itemBuilder: (context, index, pageViewIndex) {
                final item = widget.images[index];

                return InkWell(
                  onTap: () {
                    widget.showFullScreenImage == false
                        ? widget.onTap?.call(index)
                        : ImageSliderScreen.navigateTo(
                            context: context,
                            images: widget.images,
                            initialIndex: pageViewIndex,
                          );
                  },
                  child: FractionallySizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ImageWrapper(
                        imageUrl: item,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: widget.height ?? 240,
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlay: widget.autoPlay,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              )),
        ),
        if (widget.showCounter)
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("${_current + 1} / ${widget.images.length}"),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
