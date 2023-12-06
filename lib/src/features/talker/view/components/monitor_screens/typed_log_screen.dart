part of '../../../talker.dart';

class TalkerMonitorTypedLogsScreenW extends StatelessWidget {
  const TalkerMonitorTypedLogsScreenW({
    Key? key,
    required this.exceptions,
    required this.theme,
    required this.typeName,
  }) : super(key: key);

  final String typeName;
  final TalkerScreenTheme theme;
  final List<TalkerDataInterface> exceptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: PrimaryAppBar(
        title: 'Monitor: $typeName',
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: Gap(10)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final data = exceptions[index];
                return LogDataCard(
                  data: data,
                  onTap: () => _copyTalkerDataItemText(context, data),
                );
              },
              childCount: exceptions.length,
            ),
          ),
        ],
      ),
    );
  }

  void _copyTalkerDataItemText(BuildContext context, TalkerDataInterface data) {
    final text = data.generateTextMessage();
    Clipboard.setData(ClipboardData(text: text));
    AppDialogs.showToast(context, title: context.l10n.logItemCopied);
  }
}
