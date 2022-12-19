import 'package:flutter/material.dart';
import 'package:portfolio/generated/colors.gen.dart';
import 'package:portfolio/generated/fonts.gen.dart';
import 'package:portfolio/src/common/extensions/build_context_x.dart';

import '../../../../../generated/assets.gen.dart';
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
          Expanded(flex: 2, child: _center(context)),
          const Expanded(child: Right()),
        ],
      ),
    );
  }

  Widget _center(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Assets.images.image2.image(),
    );
  }

  Widget _menu(BuildContext context) {
    return Column(
      children: [
        _logo(context),
        // Container(
        //   width: 75,
        //   height: 400,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(16),
        //     color: Colors.grey.shade50,
        //   ),
        //   child: Column(
        //     children: <Widget>[
        //       const SizedBox(height: 20),
        //       _icon(Assets.icons.icHome.svg()),
        //       const SizedBox(height: 10),
        //       _icon(Assets.icons.icHome.svg()),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget _logo(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 2,
          alignment: WrapAlignment.center,
          children: [
            const Text("Cogi",
                style: TextStyle(
                  fontSize: 26,
                    color: Colors.deepOrangeAccent,
                    fontFamily: FontFamily.roboto,
                    fontWeight: FontWeight.w900)),
            Container(
              width: 60,
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.deepOrangeAccent.shade200,
              ),
              child: const Center(
                child: Text('<dev/>',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontFamily: FontFamily.monoLisa,
                        fontWeight: FontWeight.w400)),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _icon(Widget icon) {
    return IconButton(onPressed: () {}, icon: icon);
  }
}
