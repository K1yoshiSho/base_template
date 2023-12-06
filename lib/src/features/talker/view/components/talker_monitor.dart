// ignore_for_file: implementation_imports

part of '../../talker.dart';

class TalkerMonitorW extends StatelessWidget {
  const TalkerMonitorW({
    Key? key,
    required this.theme,
    required this.talker,
  }) : super(key: key);

  /// Theme for customize [TalkerScreen]
  final TalkerScreenTheme theme;

  /// Talker implementation
  final Talker talker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: const PrimaryAppBar(
        title: "Base project Monitor",
      ),
      body: TalkerBuilder(
        talker: talker,
        builder: (context, data) {
          final logs = data.whereType<TalkerLog>().toList();
          final errors = data.whereType<TalkerError>().toList();
          final exceptions = data.whereType<TalkerException>().toList();
          final warnings = logs.where((e) => e.logLevel == LogLevel.warning).toList();

          final infos = logs.where((e) => e.logLevel == LogLevel.info).toList();
          final verboseDebug = logs.where((e) => e.logLevel == LogLevel.verbose || e.logLevel == LogLevel.debug).toList();

          final httpRequests = data.where((e) => e.title == WellKnownTitles.httpRequest.title).toList();
          final httpErrors = data.where((e) => e.title == WellKnownTitles.httpError.title).toList();
          final httpResponses = data.where((e) => e.title == WellKnownTitles.httpResponse.title).toList();
          final allHttps = data.where((e) {
            return e.title == WellKnownTitles.httpRequest.title ||
                e.title == WellKnownTitles.httpError.title ||
                e.title == WellKnownTitles.httpResponse.title;
          }).toList();

          return CustomScrollView(
            slivers: [
              if (httpRequests.isNotEmpty) ...[
                const SliverToBoxAdapter(child: Gap(10)),
                SliverToBoxAdapter(
                  child: TalkerMonitorCardW(
                    logs: httpRequests,
                    title: 'Http запросы',
                    color: const Color.fromARGB(255, 93, 203, 96),
                    icon: Icons.wifi,
                    onTap: () => _openHttpMonitor(context, allHttps, 'HTTP'),
                    subtitleWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '${httpRequests.length}',
                            style: AppTextStyle.b3(context),
                            children: const [TextSpan(text: ' http запросов было сделано')],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '${httpResponses.length} успешных',
                            style: AppTextStyle.b3(context).copyWith(color: const Color.fromARGB(255, 93, 203, 96)),
                            children: [
                              TextSpan(
                                text: ' ответов получено',
                                style: AppTextStyle.b3(context),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '${httpErrors.length} ошибочных',
                            style: AppTextStyle.b3(context).copyWith(color: AppPalette.danger),
                            children: [
                              TextSpan(
                                text: ' ответов получено',
                                style: AppTextStyle.b3(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              if (errors.isNotEmpty) ...[
                const SliverToBoxAdapter(child: Gap(10)),
                SliverToBoxAdapter(
                  child: TalkerMonitorCardW(
                    logs: errors,
                    title: 'Ошибки',
                    color: AppPalette.danger,
                    icon: Icons.error_outline_rounded,
                    subtitle: 'Количество неразрешенных ошибок в приложении: ${errors.length}',
                    onTap: () => _openTypedLogsScreen(context, errors, 'Errors'),
                  ),
                ),
              ],
              if (exceptions.isNotEmpty) ...[
                const SliverToBoxAdapter(child: Gap(10)),
                SliverToBoxAdapter(
                  child: TalkerMonitorCardW(
                    logs: exceptions,
                    title: 'Исключения',
                    color: LogLevel.error.color,
                    icon: Icons.error_outline_rounded,
                    subtitle: 'Количество неразрешенных исключении в приложении: ${exceptions.length}',
                    onTap: () => _openTypedLogsScreen(context, exceptions, 'Exceptions'),
                  ),
                ),
              ],
              if (warnings.isNotEmpty) ...[
                const SliverToBoxAdapter(child: Gap(10)),
                SliverToBoxAdapter(
                  child: TalkerMonitorCardW(
                    logs: warnings,
                    title: 'Предупреждения',
                    color: LogLevel.warning.color,
                    icon: Icons.warning_amber_rounded,
                    subtitle: 'Количество предупреждении в приложении: ${warnings.length}',
                    onTap: () => _openTypedLogsScreen(context, warnings, 'Warnings'),
                  ),
                ),
              ],
              if (infos.isNotEmpty) ...[
                const SliverToBoxAdapter(child: Gap(10)),
                SliverToBoxAdapter(
                  child: TalkerMonitorCardW(
                    logs: infos,
                    title: 'Информационный',
                    color: LogLevel.info.color,
                    icon: Icons.info_outline_rounded,
                    subtitle: 'Количество информационных логов: ${infos.length}',
                    onTap: () => _openTypedLogsScreen(context, infos, 'Infos'),
                  ),
                ),
              ],
              if (verboseDebug.isNotEmpty) ...[
                const SliverToBoxAdapter(child: Gap(10)),
                SliverToBoxAdapter(
                  child: TalkerMonitorCardW(
                    logs: verboseDebug,
                    title: 'Отладка',
                    color: LogLevel.verbose.color,
                    icon: Icons.remove_red_eye_outlined,
                    subtitle: 'Количество отладочных логов: ${verboseDebug.length}',
                    onTap: () => _openTypedLogsScreen(
                      context,
                      verboseDebug,
                      'Verbose & debug',
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  void _openHttpMonitor(
    BuildContext context,
    List<TalkerDataInterface> logs,
    String typeName,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TalkerMonitorHttpScreen(
          exceptions: logs,
          theme: theme,
          typeName: typeName,
        ),
      ),
    );
  }

  void _openTypedLogsScreen(
    BuildContext context,
    List<TalkerDataInterface> logs,
    String typeName,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TalkerMonitorTypedLogsScreenW(
          exceptions: logs,
          theme: theme,
          typeName: typeName,
        ),
      ),
    );
  }
}
