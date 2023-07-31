part of 'home_body.dart';

class Right extends StatelessWidget {
  const Right({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Workflow();
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
          width: ResponsiveValue<double>(context, conditionalValues: [
            Condition.equals(name: MOBILE, value: 450),
            Condition.between(start: 800, end: 1100, value: 800),
            Condition.largerThan(breakpoint: 1000, value: 1000),
            // There are no conditions for width over 1200
            // because the `maxWidth` is set to 1200 via the MaxWidthBox.
          ]).value,
          child: Assets.lottie.workflow.lottie(),
        ),
      );
    });
  }
}
