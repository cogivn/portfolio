import 'package:get_it/get_it.dart';

import '../../core/application/cubits/lang/lang_cubit.dart';
import '../../core/infrastrcuture/repositories/lang_repository.dart';
import '../../modules/app/app_router.dart';


final getIt = GetIt.instance;

class GetItUtils {
  static setup() async {
    getIt.registerSingleton(AppRouter());
    getIt.registerLazySingleton(() => LangRepository());
    getIt.registerSingleton(LangCubit(getIt<LangRepository>()));
  }
}