import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/common/presentation/components/ui_kit/panels/media_panel.dart';
import 'package:base/src/core/common/presentation/screens/all_media_full_screen.dart';
import 'package:base/src/core/resource/domain/models/media.dart';

class MediaAlbumScreen extends StatelessWidget {
  final String title;
  final List<MediaModel> medias;
  const MediaAlbumScreen({super.key, required this.title, required this.medias});

  static const String name = "Media Album";
  static const String routePath = "/media_album";

  static void navigateTo({
    required BuildContext context,
    required String title,
    required List<MediaModel> medias,
  }) {
    context.pushNamed(
      name,
      queryParameters: {
        ScreenExtras.title: title.toString(),
      },
      extra: {
        ScreenExtras.object: medias,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: medias.length,
          itemBuilder: (BuildContext context, int index) {
            return MediaPreview(
              media: medias[index],
              onTap: () {
                AllMediaSliderScreen.navigateTo(
                  context: context,
                  title: title,
                  medias: medias,
                  initialIndex: index,
                  onPageChanged: null,
                );
              },
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
        ),
      ),
    );
  }
}
