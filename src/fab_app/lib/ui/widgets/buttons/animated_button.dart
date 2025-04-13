part of fab_app;

typedef ActionControllerCallback = Future Function(AnimatedButtonController controller);

class AnimatedButton extends UiView {
  final AnimatedButtonController controller = AnimatedButtonController();

  final ActionControllerCallback? onPressed;
  final Widget child;

  AnimatedButton({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      borderRadius: 5,
      successIcon: Icons.cloud,
      failedIcon: Icons.error,
      controller: controller,
      onPressed: () => onPressed?.call(controller),
      child: child,
    );
  }
}

/// States that your button can assume via the controller
// ignore: public_member_api_docs

/// Initalize class
class RoundedLoadingButton extends StatefulWidget {
  /// Button controller, now required
  final AnimatedButtonController controller;

  /// The callback that is called when
  /// the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The button's label
  final Widget child;

  /// The primary color of the button
  final Color? color;

  /// The vertical extent of the button.
  final double height;

  /// The horiztonal extent of the button.
  final double width;

  /// The size of the CircularProgressIndicator
  final double loaderSize;

  /// The stroke width of the CircularProgressIndicator
  final double loaderStrokeWidth;

  /// Whether to trigger the animation on the tap event
  final bool animateOnTap;

  /// The color of the static icons
  final Color valueColor;

  /// reset the animation after specified duration,
  /// use resetDuration parameter to set Duration, defaults to 15 seconds
  final bool resetAfterDuration;

  /// The curve of the shrink animation
  final Curve curve;

  /// The radius of the button border
  final double borderRadius;

  /// The duration of the button animation
  final Duration duration;

  /// The elevation of the raised button
  final double elevation;

  /// Duration after which reset the button
  final Duration resetDuration;

  /// The color of the button when it is in the error state
  final Color? errorColor;

  /// The color of the button when it is in the success state
  final Color? successColor;

  /// The color of the button when it is disabled
  final Color? disabledColor;

  /// The icon for the success state
  final IconData successIcon;

  /// The icon for the failed state
  final IconData failedIcon;

  /// The success and failed animation curve
  final Curve completionCurve;

  /// The duration of the success and failed animation
  final Duration completionDuration;

  Duration get _borderDuration {
    return Duration(milliseconds: (duration.inMilliseconds / 2).round());
  }

  /// initalize constructor
  const RoundedLoadingButton({
    Key? key,
    required this.controller,
    required this.onPressed,
    required this.child,
    this.color = Colors.lightBlue,
    this.height = 50,
    this.width = 300,
    this.loaderSize = 24.0,
    this.loaderStrokeWidth = 2.0,
    this.animateOnTap = true,
    this.valueColor = Colors.white,
    this.borderRadius = 35,
    this.elevation = 2,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOutCirc,
    this.errorColor = Colors.red,
    this.successColor,
    this.resetDuration = const Duration(seconds: 15),
    this.resetAfterDuration = false,
    this.successIcon = Icons.check,
    this.failedIcon = Icons.close,
    this.completionCurve = Curves.elasticOut,
    this.completionDuration = const Duration(milliseconds: 1000),
    this.disabledColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RoundedLoadingButtonState();
}

/// Class implementation
class RoundedLoadingButtonState extends State<RoundedLoadingButton> with TickerProviderStateMixin {
  late AnimationController _buttonController;
  late AnimationController _borderController;
  late AnimationController _checkButtonControler;

  late Animation _squeezeAnimation;
  late Animation _bounceAnimation;
  late Animation _borderAnimation;

  final _state = BehaviorSubject<EButtonState>.seeded(EButtonState.normal);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget lCheck = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: widget.successColor ?? theme.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(_bounceAnimation.value / 2),
        ),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              widget.successIcon,
              color: widget.valueColor,
            )
          : null,
    );

    Widget lCross = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: widget.errorColor,
        borderRadius: BorderRadius.all(
          Radius.circular(_bounceAnimation.value / 2),
        ),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              widget.failedIcon,
              color: widget.valueColor,
            )
          : null,
    );

    Widget lLoader = SizedBox(
      height: widget.loaderSize,
      width: widget.loaderSize,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
        strokeWidth: widget.loaderStrokeWidth,
      ),
    );

    Widget childStream = StreamBuilder(
      stream: _state,
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: snapshot.data == EButtonState.running ? lLoader : widget.child,
        );
      },
    );

    final lBtn = ButtonTheme(
      disabledColor: widget.disabledColor,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(_squeezeAnimation.value, widget.height),
          backgroundColor: widget.color,
          disabledForegroundColor: widget.disabledColor?.withOpacity(0.38),
          disabledBackgroundColor: widget.disabledColor?.withOpacity(0.12),
          shape: RoundedRectangleBorder(
            borderRadius: _borderAnimation.value,
          ),
          elevation: widget.elevation,
          padding: const EdgeInsets.all(0),
        ),
        onPressed: widget.onPressed == null ? null : _btnPressed,
        child: childStream,
      ),
    );

    return SizedBox(
      height: widget.height,
      child: Center(
        child: _state.value == EButtonState.fail
            ? lCross
            : _state.value == EButtonState.success
                ? lCheck
                : lBtn,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _checkButtonControler = AnimationController(
      duration: widget.completionDuration,
      vsync: this,
    );

    _borderController = AnimationController(
      duration: widget._borderDuration,
      vsync: this,
    );

    _bounceAnimation = Tween<double>(
      begin: 0,
      end: widget.height,
    ).animate(
      CurvedAnimation(
        parent: _checkButtonControler,
        curve: widget.completionCurve,
      ),
    );

    _bounceAnimation.addListener(() {
      setState(() {});
    });

    _squeezeAnimation = Tween<double>(
      begin: widget.width,
      end: widget.height,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: widget.curve,
      ),
    );

    _squeezeAnimation.addListener(() {
      setState(() {});
    });

    _squeezeAnimation.addStatusListener(
      (state) {
        if (state == AnimationStatus.completed && widget.animateOnTap) {
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        }
      },
    );

    _borderAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(widget.borderRadius),
      end: BorderRadius.circular(widget.height),
    ).animate(
      _borderController,
    );

    _borderAnimation.addListener(() {
      setState(() {});
    });

    widget.controller._addListeners(
      _start,
      _stop,
      _success,
      _error,
      _reset,
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _checkButtonControler.dispose();
    _borderController.dispose();

    _state.close();

    super.dispose();
  }

  void _btnPressed() async {
    if (widget.animateOnTap) {
      _start();
    } else {
      if (widget.onPressed != null) {
        widget.onPressed!();
      }
    }
  }

  void _start() {
    if (!mounted) {
      return;
    }

    _state.sink.add(EButtonState.running);

    _borderController.forward();
    _buttonController.forward();

    if (widget.resetAfterDuration) {
      _reset();
    }
  }

  void _stop() {
    if (!mounted) {
      return;
    }

    _state.sink.add(EButtonState.normal);

    _buttonController.reverse();
    _borderController.reverse();
  }

  void _success() {
    if (!mounted) {
      return;
    }

    _state.sink.add(EButtonState.success);

    _checkButtonControler.forward();
  }

  void _error() {
    if (!mounted) {
      return;
    }

    _state.sink.add(EButtonState.fail);

    _checkButtonControler.forward();
  }

  void _reset() async {
    if (widget.resetAfterDuration) {
      await Future.delayed(widget.resetDuration);
    }

    if (!mounted) {
      return;
    }

    _state.sink.add(EButtonState.normal);

    unawaited(_buttonController.reverse());
    unawaited(_borderController.reverse());

    _checkButtonControler.reset();
  }
}

/// Options that can be chosen by the controller
/// each will perform a unique animation
class AnimatedButtonController {
  VoidCallback? _startListener;
  VoidCallback? _stopListener;
  VoidCallback? _successListener;
  VoidCallback? _errorListener;
  VoidCallback? _resetListener;

  void _addListeners(
    VoidCallback startListener,
    VoidCallback stopListener,
    VoidCallback successListener,
    VoidCallback errorListener,
    VoidCallback resetListener,
  ) {
    _startListener = startListener;
    _stopListener = stopListener;
    _successListener = successListener;
    _errorListener = errorListener;
    _resetListener = resetListener;
  }

  /// Notify listeners to start the loading animation
  void start() {
    if (_startListener != null) _startListener!();
  }

  /// Notify listeners to start the stop animation
  void stop() {
    if (_stopListener != null) _stopListener!();
  }

  /// Notify listeners to start the sucess animation
  void success() {
    if (_successListener != null) _successListener!();
  }

  /// Notify listeners to start the error animation
  void error() {
    if (_errorListener != null) _errorListener!();
  }

  /// Notify listeners to start the reset animation
  void reset() {
    if (_resetListener != null) _resetListener!();
  }
}
