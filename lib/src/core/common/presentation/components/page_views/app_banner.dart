import 'dart:developer';

import 'package:base/src/core/common/state/blocs/banner/app_banner_bloc.dart';
import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/common/presentation/components/page_views/image_slider.dart';
import 'package:base/src/core/resource/domain/models/banner.dart';

enum BannerType {
  small,
  full,
}

class AppBanner extends StatefulWidget {
  final BannerType bannerType;
  final double? paddingTop;
  final double? paddingBottom;

  const AppBanner({Key? key, this.bannerType = BannerType.full, this.paddingTop, this.paddingBottom}) : super(key: key);

  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  late final PageController pageController = PageController(initialPage: 0, viewportFraction: 1.05);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBannerBloc, AppBannerState>(
      listener: (context, state) {
        if (state is AppBannerFetchedState) {
          log('AppBannerFetchedState: ${state.banners.length}');
        }
      },
      builder: (context, state) {
        return switch (state) {
          AppBannerFetchedState() => Visibility(visible: state.banners.isNotEmpty, child: _buildBanner(banners: state.banners, isLoading: false)),
          AppBannerLoadingState() => _buildBanner(banners: [], isLoading: true),
          AppBannerFailureState() => const SizedBox(),
          _ => const SizedBox(),
        };
      },
    );
  }

  Widget _buildBanner({
    required List<BannerModel> banners,
    bool isLoading = false,
  }) {
    final images = <String>[];

    for (var banner in banners) {
      final image = widget.bannerType == BannerType.full ? banner.imageFull : banner.imageSmall;
      images.add(image);
    }

    return Padding(
      padding: EdgeInsets.only(top: widget.paddingTop ?? 0, bottom: widget.paddingBottom ?? 0),
      child: !isLoading
          ? ImageSlider(
              images: images,
              height: 140,
              showCounter: false,
              showFullScreenImage: false,
              autoPlay: true,
              onTap: (index) {
                final banner = banners[index];
                if (banner.link.isNotEmpty) {
                  launchUrl(Uri.parse(banner.link), mode: LaunchMode.externalApplication);
                }
              },
            )
          : ShimmerWrapper(
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
    );
  }
}
