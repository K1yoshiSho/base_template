import 'package:chewie/chewie.dart';
import 'package:base/src/core/common/exports/main_export.dart';
import 'package:video_player/video_player.dart';

class AnimatedLogo extends StatefulWidget {
  final double size;

  const AnimatedLogo({super.key, this.size = 100});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.asset("assets/videos/Logo-animate_forever.gif.mp4");
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      allowFullScreen: true,
      autoPlay: true,
      autoInitialize: true,
      showControls: false,
      looping: true,
      useRootNavigator: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (_chewieController != null && _chewieController!.videoPlayerController.value.isInitialized)
          ? SizedBox(height: widget.size, width: widget.size, child: Chewie(controller: _chewieController!))
          : const Center(child: DotsLoader()),
    );
  }
}
