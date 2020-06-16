part of fab_lib;

class ChartSummarizePresentableItem extends NamedValuePresentableItem {
	List<ChartValuePresentableItem> _nested = List<ChartValuePresentableItem>();

	final EChartType type;

	ChartSummarizePresentableItem(Widget icon, String key, String value, this.type, {List<ChartValuePresentableItem> items}) : super(icon, key, value) {
		_nested = items;
	}

	bool expanded;

	Iterable<ChartValuePresentableItem> get nested => _nested;

	void add(ChartValuePresentableItem item) {
		_nested.add(item);
	}

	void clear() {
		_nested.clear();
	}

  invert() {
		expanded = !expanded;
  }
}

class ChartValuePresentableItem extends PresentableItem {
	final Color color;
	final String name;
	final int value;

	@override
	ChartValuePresentableItem(this.name, this.value, this.color, {Func<Future> action}) : super(action: action);
}

enum EChartType {
	Pie,
	Bar
}

