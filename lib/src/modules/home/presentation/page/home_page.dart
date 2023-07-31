import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/generated/colors.gen.dart';
import 'package:portfolio/src/common/responsive.dart';
import 'package:portfolio/src/modules/home/presentation/page/devices/desktop_page.dart';
import 'package:portfolio/src/modules/home/presentation/page/devices/mobile_page.dart';

import '../widgets/home_body.dart';

// Our design
// https://www.behance.net/gallery/63574251/Personal-Portfolio-Website-Design?tracking_source=search_projects|developer+portfolio
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorName.primary,
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Responsive(
          desktop: DesktopPage(),
          mobile: MobilePage(),
          tablet: MobilePage(),
        ),
      ),
    );
  }
}