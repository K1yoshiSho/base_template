import 'package:chewie/chewie.dart';
import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/common/presentation/screens/all_media_full_screen.dart';
import 'package:base/src/core/resource/data/providers/router_provider.dart';
import 'package:base/src/core/resource/domain/models/locas.dart';

import 'package:video_player/video_player.dart';

class VideoBody extends StatefulWidget {
  final LocasModel? locas;
  final String videoUrl;

  const VideoBody({
    super.key,
    this.locas,
    required this.videoUrl,
  });

  @override
  State<VideoBody> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoBody> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _videoPlayerController.pause();
    _chewieController?.pause();
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initializePlayer() async {
    Uri uri = Uri.parse(widget.videoUrl);
    Uri replacedUri = uri.replace(scheme: 'https');
    _videoPlayerController = VideoPlayerController.networkUrl(replacedUri);
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      allowFullScreen: false,
      allowMuting: false,
      autoPlay: true,
      draggableProgressBar: true,
      autoInitialize: true,
      showControls: false,
      showControlsOnInitialize: false,
      looping: true,
      useRootNavigator: false,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (provide<RouterProvider>(context).getCurrentRoute != AllMediaSliderScreen.routePath) {
      setState(() {
        _chewieController?.pause();
      });
    }
    final story = widget.locas;
    return Stack(
      children: [
        _buildVideo(),
        if (story != null) ...[
          Positioned.fill(
            bottom: 10,
            child: _buildInf(story),
          ),
        ]
      ],
    );
  }

  Widget _buildVideo() {
    return (_chewieController != null && _chewieController!.videoPlayerController.value.isInitialized)
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Chewie(controller: _chewieController!),
          )
        : const Center(
            child: CircularProgressIndicator(
              color: AppPalette.white,
              strokeWidth: 3,
            ),
          );
  }

  bool showDescription = false;

  Widget _buildInf(LocasModel story) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: showDescription ? AppPalette.black.withOpacity(0.5) : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: InkWell(
                onTap: () {
                  showDescription = !showDescription;
                  setState(() {});
                },
                child: Text(
                  story.description ?? "",
                  style: AppTextStyle.b3(context),
                  maxLines: showDescription ? 20 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
