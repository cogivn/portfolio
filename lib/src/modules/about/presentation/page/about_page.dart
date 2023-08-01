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
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: _Content(),
            )
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
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText('Me', speed: 70.milliseconds),
              TypewriterAnimatedText('Duy, Pham Hoang.', speed: 70.milliseconds),
              TypewriterAnimatedText('Nathan, Pham.', speed: 70.milliseconds),
              TypewriterAnimatedText('Android Developer.', speed: 70.milliseconds),
              TypewriterAnimatedText('Flutter Developer.', speed: 70.milliseconds),
              TypewriterAnimatedText('Freelancer.', speed: 70.milliseconds),
            ],
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget{
  const _Content();

  @override
  Widget build(BuildContext context) {
  const content = '''Hi, I am a frontend developer with many years of experience in Android and Flutter. 
  \nI graduated with a degree in software engineering, I have a strong understanding of the Android SDK and Flutter framework, and I am proficient in using Kotlin, Java, and Dart. I am also familiar with the Android design guidelines and best practices. I am a certified Android ATC (Android App Certification Developer), which means that I have the knowledge and skills to help others develop high-quality Android apps. I am also a strong problem solver and I am always up for a challenge.
  \nIn my previous roles, I have developed a variety of Android and Flutter apps, including productivity apps, and social media apps. I am also experienced in working with APIs and integrating third-party services.
  \nI am passionate about building great user experiences, and I am always looking for new ways to improve the way people interact with their apps. I am also a team player and I am always willing to help others.
  \nI am confident that I have the skills and experience that you are looking for, and I am eager to learn more about your company and how I can contribute. Thank you for your time and consideration.
  ''';
    return Text(content, style: context.textTheme.content);
  }
}


