part of fab_app;

class HandleFocusNode {
  static FocusNode? handle({required bool isReadOnly}) => isReadOnly ? _AlwaysDisabledFocusNode.disabled : null;
}

class _AlwaysDisabledFocusNode extends FocusNode {
  static final disabled = _AlwaysDisabledFocusNode();

  @override
  bool get hasFocus => false;
}
