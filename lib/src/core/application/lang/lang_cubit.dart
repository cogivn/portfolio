import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:riverbloc/riverbloc.dart';

import '../../../common/utils/getit_utils.dart';
import '../../domain/interfaces/language_interface.dart';

final langProvider = BlocProvider<LangCubit, Locale>((ref) {
  return getIt<LangCubit>();
});

@injectable
class LangCubit extends Cubit<Locale> {
  LangCubit(this._repository) : super(_repository.getLocale());

  final ILangRepository _repository;

  void setLocale(Locale val) async {
    try {
      await _repository.setLocale(val);
      emit(val);
    } catch (_) {}
  }

  @override
  Future<void> close() {
    print('LangCubit closed!');
    return super.close();
  }
}
