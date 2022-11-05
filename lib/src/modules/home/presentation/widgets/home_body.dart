import 'package:flutter/material.dart';
import 'package:portfolio/src/modules/home/presentation/widgets/desktop_body.dart';
import 'package:portfolio/src/core/presentation/widgets/responsive.dart';
import 'package:portfolio/src/modules/home/presentation/widgets/right.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: Right(),
      tablet: Right(),
      desktop: DesktopBody(),
    );
  }
}
