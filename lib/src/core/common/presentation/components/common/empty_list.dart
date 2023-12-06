import 'package:base/src/core/common/exports/main_export.dart';

/// [EmptyListComponent] - component to show when there is no data.
class EmptyListComponent extends StatelessWidget {
  const EmptyListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: context.theme.appColors.card,
              boxShadow: AppStyles.getBoxShadow(context),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: NoValuesComponent(
                text: context.l10n.noValues,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
