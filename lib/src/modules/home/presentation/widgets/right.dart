import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:portfolio/src/common/extensions/build_context_x.dart';
import 'package:portfolio/src/modules/home/presentation/widgets/solid_button.dart';

import 'make_circle.dart';

class Right extends StatelessWidget {
  const Right({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Spacer(flex: 1),
        _decoration(),
        _expertOn(context),
        const SizedBox(height: 10),
        _basedOn(context),
        const SizedBox(height: 24),
        _developerName(context),
        const SizedBox(height: 8),
        role(context),
        const SizedBox(height: 30),
        _description(context),
        const SizedBox(height: 50),
        _download(context),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _expertOn(BuildContext context) {
    return Text(
      context.s.expert_on,
      style: context.textTheme.titleMedium?.copyWith(
        color: Colors.red,
      ),
    );
  }

  Widget _basedOn(BuildContext context) {
    return Text(
      context.s.based_on,
      style: context.textTheme.titleLarge,
    );
  }

  Widget role(BuildContext context) {
    return Text(
      context.s.role,
      style: context.textTheme.titleLarge,
    );
  }

  Widget _developerName(BuildContext context) {
    return Row(
      children: <Widget>[
        _iam(context),
        _name(context),
      ],
    );
  }

  Widget _iam(BuildContext context) {
    return Text(context.s.iam, style: context.textTheme.headlineLarge);
  }

  Widget _name(BuildContext context) {
    return Text(context.s.name,
        style: context.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w900,
          color: Colors.red,
        ));
  }

  Widget _description(BuildContext context) {
    return Text(
      context.s.description,
      style: context.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    );
  }

  Widget _download(BuildContext context) {
    return SolidButton(text: context.s.download_cv, onPressed: () {
      js.context.callMethod('open', [context.s.cv_url]);
    });
  }

  Widget _decoration() {
    return Stack(
      children: [
        SizedBox(
          child: CustomPaint(
            painter: MakeCircle(strokeWidth: 80, strokeCap: StrokeCap.round),
          ),
        )
      ],
    );
  }
}
