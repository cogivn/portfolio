import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/src/modules/home/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    RedirectRoute(path: '*', redirectTo: '/')
  ],
)
class AppRouter extends _$AppRouter {}
