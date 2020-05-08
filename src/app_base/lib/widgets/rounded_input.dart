library app_base;

import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
		final Widget child;
		final IconData icon;

		RoundedInput({Key key, this.child, this.icon}) : super(key: key);

		@override
		Widget build(BuildContext context) {
				return Container(
						decoration: BoxDecoration(
								border: Border.all(
										color: Colors.grey.withOpacity(0.5),
										width: 1.0,
								),
								borderRadius: BorderRadius.circular(20.0),
						),
						margin: const EdgeInsets.symmetric(
								vertical: 10.0, horizontal: 20.0),
						child: Row(
								children: <Widget>[
										Padding(
												padding: EdgeInsets.symmetric(
														vertical: 10.0, horizontal: 15.0),
												child: Icon(
														this.icon,
														color: Colors.grey,
												),
										),
										Container(
												height: 30.0,
												width: 1.0,
												color: Colors.grey.withOpacity(0.5),
												margin: const EdgeInsets.only(left: 00.0, right: 10.0),
										),
										Expanded(
												child: child,
										)
								],
						),
				);
		}
}