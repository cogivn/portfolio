import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/src/common/extension/build_context_x.dart';
import 'package:responsive_framework/responsive_row_column.dart';

import '../../../../../../generated/assets.gen.dart';
import '../../widgets/home_body.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(child: _Headline()),
          const ResponsiveRowColumnItem(
            columnFit: FlexFit.tight,
            columnFlex: 1,
            child: TabBarView(
              children: [
                _Body(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.ROW,
        children: [
          const ResponsiveRowColumnItem(child: _Logo()),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.only(right: 40),
                width: 340,
                child: TabBar(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  labelColor: Colors.black,
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: context.textTheme.bodySmall,
                  labelStyle: context.textTheme.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: context.s.tab_home),
                    Tab(text: context.s.tab_about),
                    Tab(text: context.s.tab_works),
                    Tab(text: context.s.tab_contacts),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Assets.icons.icAndroid.svg(
        colorFilter: const ColorFilter.mode(
          Colors.green,
          BlendMode.srcIn,
        ),
        width: 60,
        height: 60,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Stack(children: [_Background(), HomeBody()]);
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
