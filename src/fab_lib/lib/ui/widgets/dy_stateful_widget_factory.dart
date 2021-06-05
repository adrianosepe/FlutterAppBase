part of fab_lib;

class DyStatefulWidgetFactory {
  static StatefulWidget create<TState extends State<StatefulWidget>>(Func<TState> funcCreate) {
    return DyStatefulWidget(funcCreate);
  }
}

class DyStatefulWidget extends StatefulWidget {
  final Func<State<StatefulWidget>> funcCreate;

  DyStatefulWidget(this.funcCreate);

  @override
  State<StatefulWidget> createState() => funcCreate();
}
abstract class DyState extends State<DyStatefulWidget> { }

class FuncStateWidget extends StatefulWidget {
	final Func1<_FuncStateWidgetState, Widget> create;

	const FuncStateWidget({Key key, this.create}) : super(key: key);

	@override
	_FuncStateWidgetState createState() => _FuncStateWidgetState();
}
class _FuncStateWidgetState extends State<FuncStateWidget> {
	@override
	Widget build(BuildContext context) => widget.create(this);
}