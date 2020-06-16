part of fab_lib;

class NamedValuePresentableItem extends PresentableItem {
	final Widget icon;
	final String name;
	final String value;
	final String detail;

	@override
	NamedValuePresentableItem(this.icon, this.name, this.value, {this.detail = '', Func<Future> action}) : super(action: action);
}