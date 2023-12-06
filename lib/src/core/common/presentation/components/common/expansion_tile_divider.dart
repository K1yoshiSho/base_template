import 'package:base/src/core/common/exports/main_export.dart';

/// [ExpansionTileDivider] - this components is used for displaying divider.
class ExpansionTileDivider extends StatelessWidget {
  const ExpansionTileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gap(16),
        AppDivider(),
        Gap(12),
      ],
    );
  }
}
