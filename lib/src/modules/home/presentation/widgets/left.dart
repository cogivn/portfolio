part of 'home_body.dart';

class Left extends StatelessWidget {
  const Left({super.key, this.alignment = Alignment.center});

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return _Body(alignment);
  }
}

class _Body extends StatelessWidget {
  final Alignment alignment;

  const _Body(this.alignment);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: const ResponsiveRowColumn(
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
      context.s.title,
      style: context.textTheme.title,
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.s.introduce,
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
        Text(context.s.see_my_works, style: context.textTheme.seeMyWorks),
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
