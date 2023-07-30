part of 'home_body.dart';

class Right extends StatelessWidget {
  const Right({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      flex: 4,
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        columnMainAxisSize: MainAxisSize.max,
        columnCrossAxisAlignment: CrossAxisAlignment.end,
        columnMainAxisAlignment: MainAxisAlignment.start,
        children: [
          ResponsiveRowColumnItem(child: _Menu()),
          ResponsiveRowColumnItem(child: Expanded(child: _Workflow()))
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 100),
      child: SizedBox(
        height: 80,
        child: Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            runSpacing: 25,
            spacing: 25,
            children: [
              Text('HOME', style: context.textTheme.menuActive),
              Text('ABOUT', style: context.textTheme.menu),
              Text('WORKS', style: context.textTheme.menu),
              Text('CONTACTS', style: context.textTheme.menu),
            ],
          ),
        ),
      ),
    );
  }
}

class _Workflow extends StatelessWidget {
  const _Workflow();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Align(
        alignment: Alignment.centerLeft,
        child: ResponsiveScaledBox(
          width: constraint.maxWidth * .7,
          child: Assets.lottie.workflow.lottie(),
        ),
      );
    });
  }
}
