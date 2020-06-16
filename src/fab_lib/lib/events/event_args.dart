part of fab_lib;

class EventArgs {
}

typedef EventHandler = void Function(Object sender, EventArgs args);

class CancelEventsArgs extends EventArgs {
	bool cancel;
}

typedef CancelEventHandler = void Function(Object sender, CancelEventsArgs args);

class ActionCancelEventsArgs<TData> extends EventArgs {
	bool cancel;
	TData data;
}

typedef ActionCancelEventHandler<TData> = Future<Null> Function(Object sender, ActionCancelEventsArgs<TData> args);