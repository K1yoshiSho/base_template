import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/common/presentation/screens/all_media_full_screen.dart';
import 'package:base/src/core/common/presentation/screens/all_media_screen.dart';
import 'package:base/src/core/resource/domain/models/media.dart';

class MediaPanel extends StatelessWidget {
  final CardModel card;
  final EdgeInsets padding;
  final bool isLoading;

  const MediaPanel({
    super.key,
    required this.card,
    this.padding = EdgeInsets.zero,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (card.media.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.media,
                style: AppTextStyle.h2(context),
              ),
              InkWell(
                onTap: () {
                  MediaAlbumScreen.navigateTo(
                    context: context,
                    title: card.name,
                    medias: card.media,
                  );
                },
                child: Text(
                  context.l10n.see_all,
                  style: AppTextStyle.b2(context),
                ),
              ),
            ],
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildPreviewItem(0, context)),
              const Gap(8),
              Expanded(child: _buildPreviewItem(1, context)),
              const Gap(8),
              Expanded(child: _buildPreviewItem(2, context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewItem(int index, BuildContext context) {
    if (index > card.media.length - 1) {
      return const SizedBox();
    }
    return MediaPreview(
      media: card.media[index],
      onTap: () {
        AllMediaSliderScreen.navigateTo(
          context: context,
          title: card.name,
          medias: card.media,
          initialIndex: index,
          onPageChanged: null,
        );
      },
    );
  }
}

class MediaPreview extends StatelessWidget {
  final MediaModel media;
  final VoidCallback? onTap;

  const MediaPreview({super.key, required this.media, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ImageWrapper(
            imageUrl: media.isImage ? media.link : media.preview,
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                onTap?.call();
              },
            ),
          ),
        ),
        if (media.isLocas)
          const Positioned(
            bottom: 11,
            left: 14,
            child: Icon(LocaIcons.outlined_play),
          ),
      ]),
    );
  }
}
