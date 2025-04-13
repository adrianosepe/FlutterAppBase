part of fab_app;

// ignore_for_file: deprecated_member_use

class UiAsyncButton<TData> extends StatefulWidget {
  final ActionCancelEventHandler<TData>? onExecute;
  final Act1<TData>? onSuccess;
  final Act1<TData?>? onFail;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  const UiAsyncButton({
    Key? key,
    required this.onExecute,
    this.onSuccess,
    this.onFail,
    this.child,
    this.color,
    this.textColor,
    this.padding = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  UiAsyncButtonState<TData> createState() => UiAsyncButtonState<TData>();
}

class UiAsyncButtonState<TData> extends State<UiAsyncButton<TData>> {
  EButtonState _state = EButtonState.normal;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: widget.color,
        foregroundColor: widget.textColor,
        // backgroundColor: Colors.blue,
        padding: widget.padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: widget.onExecute == null ? null : _onPressed,
      child: _setupButtonChild(),
    );
  }

  void _onPressed() async {
    if (_state == EButtonState.running) {
      return;
    }

    setState(
      () {
        _state = EButtonState.running;
      },
    );

    final args = ActionCancelEventsArgs<TData>();
    await widget.onExecute!(this, args);

    setState(
      () {
        _state = args.cancel ? EButtonState.fail : EButtonState.success;
      },
    );

    await Future.delayed(const Duration(milliseconds: 850));

    if (args.cancel) {
      widget.onFail?.call(args.data);
    } else {
      widget.onSuccess?.call(args.data as TData);
    }
  }

  Widget _setupButtonChild() {
    if (_state == EButtonState.normal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 14,
            height: 20,
          ),
          widget.child ?? Container(),
          const SizedBox(
            width: 14,
          ),
        ],
      );
    } else if (_state == EButtonState.running) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
          ),
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          widget.child ?? Container()
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Icon(
            _state == EButtonState.success //
                ? Icons.check
                : Icons.error,
            color: widget.textColor,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        widget.child ?? Container()
      ],
    );
  }
}
