import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/modules/app/app_widget.dart';

import 'src/common/utils/app_environment.dart';
import 'src/common/utils/getit_utils.dart';
import 'src/core/infrastructure/datasource/local/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppEnvironment.setup();
  await Storage.setup();
  await GetItUtils.setup();

  runApp(const ProviderScope(child: AppWidget()));
}