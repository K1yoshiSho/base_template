// import 'package:base/src/core/common/exports/main_export.dart';
// import 'package:base/src/core/common/presentation/components/builders/row_builder.dart';
// import 'package:base/src/core/common/presentation/screens/video_screen.dart';
// import 'package:base/src/core/resource/domain/models/media.dart';
// import 'package:photo_view_x/photo_view_x.dart';

// class FullImageViewer extends StatefulWidget {
//   final String title;
//   final String imageUrl;

//   static const String name = 'Full image viewer';
//   static const String routePath = '/full_image_viewer';

//   const FullImageViewer({
//     super.key,
//     required this.initialIndex,
//     required this.title,
//     required this.medias,
//     required this.onPageChanged,
//   });

//   static void navigateTo({
//     required BuildContext context,
//     required String title,
//     required int initialIndex,
//     required List<MediaModel> medias,
//     required Function(int)? onPageChanged,
//   }) {
//     context.pushNamed(name, queryParameters: {
//       ScreenExtras.title: title,
//       ScreenExtras.initialIndex: initialIndex.toString(),
//     }, extra: {
//       ScreenExtras.object: medias,
//       ScreenExtras.function: onPageChanged,
//     });
//   }

//   @override
//   State<FullImageViewer> createState() => _ImageSliderState();
// }

// class _ImageSliderState extends State<FullImageViewer> {
//   final SpacingPageController _pageController = SpacingPageController(viewportFraction: 1);

//   int _current = 0;

//   final defaultUrl = 'https://waterparkworld.ru/wp-content/uploads/2021/10/F370.jpg';

//   @override
//   void initState() {
//     super.initState();
//     _current = widget.initialIndex;

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _pageController.jumpToPage(
//         widget.initialIndex,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppPalette.black,
//       appBar: PrimaryAppBar(title: widget.title),
//       body: Stack(
//         children: [
//           SizedBox(
//             height: context.height,
//             width: double.infinity,
//             child: PhotoPageView(
//               controller: _pageController,
//               physics: const BouncingScrollPhysics(),
//               itemCount: widget.medias.length,
//               onPageChanged: (index) {
//                 setState(() {
//                   _current = index;
//                 });
//               },
//               itemBuilder: (BuildContext context, int index) {
//                 return widget.medias[index].isImage
//                     ? PhotoView(
//                         tapEnabled: true,
//                         child: FractionallySizedBox(
//                             widthFactor: 1 / 1.02,
//                             child: Image.network(
//                               widget.medias[index].link,
//                               loadingBuilder: (context, child, loadingProgress) {
//                                 if (loadingProgress == null) return child;
//                                 return const Center(
//                                   child: DotsLoader(),
//                                 );
//                               },
//                               // fit: BoxFit.scaleDown,
//                             )),
//                       )
//                     : FractionallySizedBox(
//                         widthFactor: 1 / 1.02,
//                         child: VideoBody(
//                           videoUrl: widget.medias[index].link,
//                           locas: widget.medias[index].locas,
//                         ),
//                       );
//               },
//             ),
//           ),
//           (widget.medias.length > 1)
//               ? Align(
//                   alignment: const Alignment(0, 0.9),
//                   child: _CustomDots(
//                     itemCount: widget.medias.length,
//                     current: _current,
//                   ),
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }
// }

// class _CustomDots extends StatelessWidget {
//   final int itemCount;
//   final int current;

//   const _CustomDots({required this.itemCount, required this.current});

//   @override
//   Widget build(BuildContext context) {
//     const dotWidthCurrent = 25.0;
//     const dotWidthNormal = 10.0;
//     const dotHeight = 6.0;
//     const dotMargin = EdgeInsets.all(2.5);
//     const borderRadius = BorderRadius.all(Radius.circular(2.5));

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         RowBuilder(
//           itemCount: itemCount,
//           mainAxisAlignment: MainAxisAlignment.center,
//           itemBuilder: (context, index) {
//             final isSelected = index == current;

//             return AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               width: isSelected ? dotWidthCurrent : dotWidthNormal,
//               height: dotHeight,
//               margin: dotMargin,
//               decoration: BoxDecoration(
//                 color: isSelected ? AppPalette.white : AppPalette.lightGrey,
//                 borderRadius: borderRadius,
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
