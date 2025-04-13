part of fab_lib;

class EventArgs {}

typedef EventHandler = void Function(Object sender, EventArgs args);

class CancelEventsArgs extends EventArgs {
  bool cancel = false;
}

typedef CancelEventHandler = void Function(Object sender, CancelEventsArgs args);

class ActionCancelEventsArgs<TData> extends EventArgs {
  bool cancel = false;
  TData? data;

  ActionCancelEventsArgs({this.data});
}

typedef ActionCancelEventHandler<TData> = Future<void> Function(Object sender, ActionCancelEventsArgs<TData> args);
