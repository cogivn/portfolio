import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/common/extension/build_context_x.dart';
import 'package:portfolio/src/common/extension/int_duration_x.dart';
import 'package:portfolio/src/modules/about/presentation/style/about_style.dart';
import 'package:responsive_framework/responsive_framework.dart';

// https://dribbble.com/shots/5971795-HAAR-About-Me

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaxWidthBox(
      maxWidth: 1000,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _AnimatedMe(),
          ],
        ),
      ),
    );
  }
}

class _AnimatedMe extends StatelessWidget {
  const _AnimatedMe();

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme.aboutTitle;
    final activeStyle = style.copyWith(color: Colors.green);
    return Row(
      children: [
        Text('About ', style: style),
        DefaultTextStyle(
          style: activeStyle,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('Me', speed: 70.milliseconds),
              TypewriterAnimatedText('Android Developer',
                  speed: 70.milliseconds),
              TypewriterAnimatedText('Flutter Developer',
                  speed: 70.milliseconds),
              TypewriterAnimatedText('Freelancer', speed: 70.milliseconds),
            ],
          ),
        ),
      ],
    );
  }
}
