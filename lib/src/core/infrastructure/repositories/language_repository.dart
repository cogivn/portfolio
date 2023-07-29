import 'dart:io';
import 'dart:ui';

import 'package:injectable/injectable.dart';
import '../../../../generated/l10n.dart';
import '../../../common/extension/locale_x.dart';
import '../../domain/interfaces/language_interface.dart';
import '../datasource/local/storage.dart';

@Singleton(as: ILangRepository)
class LangRepository implements ILangRepository {
  @override
  Locale getDeviceLocale() => Platform.localeName.toLocale;

  @override
  Locale getLocale() {
    final String lang = Storage.lang ?? 'en';
    final locale = lang.toLocale;
    if (S.delegate.isSupported(locale)) {
      return locale;
    } else {
      return LocaleX.fallbackLocale;
    }
  }

  @override
  Future setLocale(Locale val) async =>
      await Storage.setLang(val.fullLanguageCode);
}
