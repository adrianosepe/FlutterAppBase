import 'package:app_base/events/delegates.dart';
import 'package:app_base/ui/models/presentable_item.dart';
import 'package:flutter/widgets.dart';

class NamedValuePresentableItem extends PresentableItem {
	final Widget icon;
	final String name;
	final String value;
	final String detail;

	@override
	NamedValuePresentableItem(this.icon, this.name, this.value, {this.detail = '', Func<Future> action}) : super(action: action);
}