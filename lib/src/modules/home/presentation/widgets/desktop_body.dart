import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/generated/colors.gen.dart';
import 'right.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _menu(context),
          Expanded(flex: 2,child: _center(context)),
          const Expanded(child: Right()),
        ],
      ),
    );
  }

  Widget _center(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(50.0),
      child: SizedBox(),
    );
  }

  Widget _menu(BuildContext context) {
    return Container(
      width: 75,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorName.materialPrimary,
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          _icon(SvgPicture.asset(
            "assets/icons/ic_home_active.svg",
            color: Colors.orangeAccent,
          )),
          const SizedBox(height: 10),
          _icon(SvgPicture.asset("assets/icons/ic_home_active.svg")),
        ],
      ),
    );
  }

  Widget _icon(Widget icon) {
    return IconButton(onPressed: () {}, icon: icon);
  }
}
