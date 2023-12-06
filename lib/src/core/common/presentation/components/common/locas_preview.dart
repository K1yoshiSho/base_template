import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/resource/domain/models/locas.dart';

class LocasPreview extends StatelessWidget {
  final LocasModel story;
  final VoidCallback? onTap;

  const LocasPreview({super.key, required this.story, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 144,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ImageWrapper(
            imageUrl: story.previewImageUrl,
          ),
        ),
      ),
    );
  }
}
