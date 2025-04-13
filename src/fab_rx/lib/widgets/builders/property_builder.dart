import 'package:fab_app/fab_app.dart';
import 'package:fab_rx/fab_rx.dart';
import 'package:flutter/material.dart';

class UiPropertyBuilder<T> extends UiView {
  final Property<T> property;

  final AsyncWidgetBuilder<T?> builder;

  const UiPropertyBuilder({
    super.key,
    required this.property,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder<T?>(stream: property.stream, builder: this.builder);
}
