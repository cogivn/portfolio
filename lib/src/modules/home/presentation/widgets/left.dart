part of 'home_body.dart';

class Left extends StatelessWidget {
  const Left({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flexible(
        flex: 3,
        child: ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.COLUMN,
          columnMainAxisSize: MainAxisSize.max,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          columnMainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveRowColumnItem(child: _Logo()),
            ResponsiveRowColumnItem(child: Expanded(child: _Body()))
          ],
        ));
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        height: 80,
        child: Assets.icons.icAndroid.svg(
          colorFilter: const ColorFilter.mode(
            Colors.green,
            BlendMode.srcIn,
          ),
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerRight,
      child: ResponsiveRowColumn(
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        columnMainAxisSize: MainAxisSize.min,
        layout: ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(child: _Title()),
          ResponsiveRowColumnItem(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: _Description(),
            ),
          ),
          ResponsiveRowColumnItem(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: _SeeMyWork(),
            ),
          ),
          ResponsiveRowColumnItem(child: _SocialArea())
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Building for android\n& flutter.',
      style: context.textTheme.title,
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi! I\'m Nathan Pham. \n\nA passionate Android/Flutter Developer based in the Vietnam.\nI would like to express my interest in your company and in your job offer. \nMoreover, i know exractly how to become an expert in android/flutter platform.',
      style: context.textTheme.description,
    );
  }
}

class _SeeMyWork extends StatelessWidget {
  const _SeeMyWork();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      spacing: 15,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text('SEE MY WORKS', style: context.textTheme.seeMyWorks),
        const Icon(Icons.arrow_forward, size: 14)
      ],
    );
  }
}

class _SocialArea extends StatelessWidget {
  const _SocialArea();

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 5,
        spacing: 5,
        runAlignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconButton(
            splashRadius: 30,
            onPressed: () async {
              _launch('https://github.com/cogivn');
            },
            padding: EdgeInsets.zero,
            icon: Assets.icons.icGithub.svg(width: 24, height: 24),
          ),
          IconButton(
            onPressed: () async {
              _launch('https://www.linkedin.com/in/duyph94/');
            },
            splashRadius: 30,
            padding: EdgeInsets.zero,
            icon: Assets.icons.icLinkedin.svg(width: 24, height: 24),
          ),
          IconButton(
            onPressed: () async {
              _launch('https://discordapp.com/users/859308791719133184');
            },
            splashRadius: 30,
            padding: EdgeInsets.zero,
            icon: Assets.icons.icDiscord.svg(width: 20, height: 20),
          ),
        ]);
  }

  Future<void> _launch(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }
}
