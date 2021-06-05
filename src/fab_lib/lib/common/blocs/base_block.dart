import 'package:flutter/widgets.dart';
import 'package:vmais/common/rx/app_property.dart';
import 'package:vmais/environment.dart';
import 'package:vmais/models/api/ctx/context_registre.dart';
import 'package:vmais/navigation.dart';

abstract class BaseBloc {
  final form = BaseForm();

  Environment get evt => Environment.instance;
  Navigation get nav => evt.nav;
  ContextRegistre get ctxRegistre => evt.ctxRegistre;

  void init() {
    internalInit();
  }

  void dispose() => internalDispose();

  void loadDebugValues() => internalLoadDefaultValues();

  @protected
  void internalLoadDefaultValues() {}

  @protected
  void internalInit() {}

  @protected
  void internalDispose() {}
}

class BaseForm {
  final _properties = List<Property>();

  bool _isReadOnly = false;

  BaseForm add(Property property) {
    _properties.add(property);

    return this;
  }

  BaseForm addAll(Iterable<Property> properties) {
    _properties.addAll(properties);

    return this;
  }

  void internalIsReadOnlyChanged() {
    final rd = _isReadOnly;
    for (final p in _properties) {
      p.isReadOnly = rd;
    }
  }

  bool get isReadOnly => _isReadOnly;
  set isReadOnly(bool value) {
    if (_isReadOnly == value) {
      return;
    }

    _isReadOnly = value;
    internalIsReadOnlyChanged();
  }
}
