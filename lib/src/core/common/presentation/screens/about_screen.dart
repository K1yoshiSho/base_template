import 'package:chewie/chewie.dart';
import 'package:base/src/core/common/exports/main_export.dart';
import 'package:video_player/video_player.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  static const String name = 'About';
  static const String routePath = '/about';

  static void show(BuildContext context) {
    context.pushNamed(name);
  }

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse("https://object.pscloud.io/loca-storage/media/44d5f9df-6846-11ee-b638-f9643fb55a7b.MOV"));
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      aspectRatio: 10 / 15.5,
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
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Base project'),
      body: (_chewieController != null && _chewieController!.videoPlayerController.value.isInitialized)
          ? Chewie(controller: _chewieController!)
          : const Center(child: DotsLoader()),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
