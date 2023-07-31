import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/src/common/extension/build_context_x.dart';
import 'package:portfolio/src/common/responsive.dart';
import 'package:portfolio/src/modules/home/presentation/style/home_style.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../generated/assets.gen.dart';

part 'left.dart';

part 'right.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 3,
          rowFit: FlexFit.tight,
          child: Left(alignment: Alignment.centerRight),
        ),
        ResponsiveRowColumnItem(rowFlex: 4, child: Right()),
      ],
    );
  }
}
