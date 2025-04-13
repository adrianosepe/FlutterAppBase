part of fab_app;

class BaseLayout extends BaseContext implements ILayout {
  @override
  final spaceSingle = const SizedBox(
    height: 5,
    width: 5,
  );

  @override
  final spaceDouble = const SizedBox(
    height: 10,
    width: 10,
  );

  @override
  final divider = const Divider(
    height: 2,
    thickness: 1,
    indent: 5,
    endIndent: 5,
  );

  final customDivider = Container(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey, width: 3.0),
      ),
    ),
  );

  @override
  final vDivider = const VerticalDivider(
    width: 2,
    thickness: 1,
    indent: 5,
    endIndent: 5,
  );

  @override
  final margin = const EdgeInsets.all(5);
  @override
  final padding = const EdgeInsets.all(5);

  Widget spaceCustom(double space) => SizedBox(height: space, width: space);
}
