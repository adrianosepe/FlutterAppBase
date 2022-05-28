part of fab_app;

class BaseLayout implements ILayout {
  final spaceSingle = const SizedBox(
    height: 5,
    width: 5,
  );

  final spaceDouble = const SizedBox(
    height: 10,
    width: 10,
  );

  final divider = const Divider(
    height: 2,
    thickness: 1,
    indent: 5,
    endIndent: 5,
  );

  final customDivider = Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey, width: 3.0),
      ),
    ),
  );

  final vDivider = const VerticalDivider(
    width: 2,
    thickness: 1,
    indent: 5,
    endIndent: 5,
  );

  final margin = const EdgeInsets.all(5);
  final padding = const EdgeInsets.all(5);

  Widget spaceCustom(double space) => SizedBox(height: space, width: space);
}
