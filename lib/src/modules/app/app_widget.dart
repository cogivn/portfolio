import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common/theme/app_theme_wrapper.dart';
import 'package:portfolio/src/core/application/lang/lang_cubit.dart';

import '../../../generated/l10n.dart';
import '../../common/theme/app_theme.dart';
import '../../common/utils/getit_utils.dart';
import 'app_router.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale locale = ref.watch(langProvider);
    final router = getIt<AppRouter>();
    return AppThemeWrapper(
      appTheme: AppTheme.create(locale),
      builder: (context, theme) {
        return MaterialApp.router(
          theme: theme,
          routerConfig: router.config(),
          locale: locale,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 900, end: 900, name: 'EXPAND_SIDE_PANEL'),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
