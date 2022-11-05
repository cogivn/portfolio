import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/src/common/extensions/locale_x.dart';
import 'package:portfolio/src/common/utils/getit_utils.dart';
import 'package:portfolio/src/common/utils/logger.dart';
import 'package:portfolio/src/core/application/cubits/lang/lang_cubit.dart';
import 'package:portfolio/src/core/infrastrcuture/repositories/lang_repository.dart';
import 'package:portfolio/src/modules/app/app_widget.dart';

import 'src/core/infrastrcuture/datasources/local/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.setup();
  await GetItUtils.setup();
  final langRepository = getIt<LangRepository>();
  logger
      .d('deviceLocale - ${langRepository.getDeviceLocale().fullLanguageCode}');
  logger.d('currentLocale - ${langRepository.getLocale().fullLanguageCode}');

  if (!kReleaseMode) {
    Bloc.observer = GlobalBlocObserver();
  }

  runApp(const MyApp());
}

class GlobalBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d('${bloc.runtimeType} $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.d('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => getIt<LangCubit>()),
    ], child: AppWidget());
  }
}
