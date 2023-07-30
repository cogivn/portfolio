import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/generated/colors.gen.dart';

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
      body: Stack(
        children: [
          _Background(),
          _Body(),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: HomeBody(),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).height * 0.65;
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: min(width, 900),
          height: min(width, 900),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
