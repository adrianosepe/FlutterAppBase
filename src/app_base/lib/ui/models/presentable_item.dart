import 'package:app_base/events/delegates.dart';

class PresentableItem {
	final Func<Future> action;

	PresentableItem({this.action});
}