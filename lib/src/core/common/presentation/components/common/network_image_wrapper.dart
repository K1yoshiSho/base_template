import 'package:base/src/core/common/exports/main_export.dart';

class ImageWrapper extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final bool useDefaultImage;
  const ImageWrapper({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.useDefaultImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return (imageUrl != null)
        ? FancyShimmerImage(
            width: width ?? 300,
            height: height ?? 300,
            imageUrl: imageUrl!,
            cacheKey: imageUrl,
            shimmerBackColor: context.theme.appColors.shimmerBase,
            shimmerBaseColor: context.theme.appColors.shimmerBase,
            shimmerHighlightColor: context.theme.appColors.shimmerHighlight,
            boxFit: BoxFit.cover,
            alignment: Alignment.center,
            errorWidget: Image.asset(
              "assets/images/no_image.png",
              fit: BoxFit.cover,
            ),
          )
        : (useDefaultImage)
            ? Image.asset(
                "assets/images/no_image.png",
                width: width ?? 300,
                height: height ?? 300,
                fit: BoxFit.cover,
              )
            : const SizedBox();
  }
}
