import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/core/application/lang/lang_cubit.dart';

import '../../../../common/extension/locale_x.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<Locale>(
              value: ref.watch(langProvider),
              items: LocaleX.supportedLocales
                  .map((locale) => DropdownMenuItem(
                        value: locale,
                        child: Text(locale.languageName),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                final langCubit = ref.read(langProvider.bloc);
                langCubit.setLocale(value);
              }),
          Text(ref.watch(langProvider).toString())
        ],
      ),
    );
  }
}
