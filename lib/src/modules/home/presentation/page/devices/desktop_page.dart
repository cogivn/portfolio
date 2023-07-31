import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../../generated/assets.gen.dart';
import '../../widgets/home_body.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [_Background(), _Body()]);
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
          width: min(width, 1000),
          height: min(width, 1000),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
