part of fab_app;

class EmptyView extends StatelessWidget {
  final EEmptyState state;

  final Widget? widget;

  final ButtonStyle? buttonStyle;

  final Color? color;

  final Widget? emptyImage;
  final Widget? emptyTitle;
  final Widget? emptyContent;
  final ButtonStyle? emptyButtonStyle;
  final Widget? emptyButtonChild;
  final VoidCallback? emptyPressed;

  final Widget? errorImage;
  final Widget? errorTitle;
  final Widget? errorContent;
  final ButtonStyle? errorButtonStyle;
  final Widget? errorButtonChild;
  final VoidCallback? errorPressed;

  final Widget? loadingWidget;
  final Widget? loadingTitle;

  final double? imageSize;
  final double? loadingSize;

  const EmptyView({
    Key? key,
    required this.state,
    this.widget,
    this.emptyImage,
    this.errorImage,
    this.loadingWidget,
    this.emptyTitle,
    this.buttonStyle,
    this.emptyButtonStyle,
    this.emptyButtonChild,
    this.emptyPressed,
    this.emptyContent,
    this.errorTitle,
    this.errorContent,
    this.errorButtonStyle,
    this.errorButtonChild,
    this.errorPressed,
    this.loadingTitle,
    this.color,
    this.imageSize = 200.0,
    this.loadingSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case EEmptyState.withError:
        return buildError(context);
      case EEmptyState.empty:
      case EEmptyState.waitingReload:
      case EEmptyState.loading:
        return buildEmpty(context);

      default:
        return Container();
    }
  }

  Widget buildError(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          children: addErrorChildren(context),
        ),
      ),
    );
  }

  Widget buildEmpty(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          children: addEmptyChildren(context),
        ),
      ),
    );
  }

  Widget buildLoading(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: addLoadingChildren(context),
        ),
      ),
    );
  }

  List<Widget> addEmptyChildren(BuildContext context) {
    final list = <Widget>[];

    list.add(emptyImage ??
        Image.asset(
          'assets/images/ic_result_empty.webp',
          width: imageSize,
          height: imageSize,
        ));

    list.add(const Gap(4));
    if (emptyTitle != null) {
      list.add(emptyTitle!);
      list.add(const Gap(4));
    }

    if (emptyContent != null) {
      list.add(emptyContent!);
      list.add(const Gap(4));
    }

    if (state == EEmptyState.waitingReload) {
      list.add(
        ElevatedButton(
          onPressed: emptyPressed,
          style: emptyButtonStyle ?? (buttonStyle ?? (ElevatedButton.styleFrom())),
          child: emptyButtonChild ?? const Text('Recarregar'),
        ),
      );
    } else if (state == EEmptyState.loading) {
      list.add(const CircularProgressIndicator());
    }

    return list;
  }

  ///添加错误子组件列表
  List<Widget> addErrorChildren(BuildContext context) {
    final list = <Widget>[];

    list.add(errorImage ??
        Image.asset(
          'assets/images/ic_result_network.webp',
          width: imageSize,
          height: imageSize,
        ));
    list.add(const Gap(4));
    if (errorTitle != null) {
      list.add(errorTitle!);
      list.add(const Gap(4));
    }
    if (errorContent != null) {
      list.add(errorContent!);
      list.add(const Gap(4));
    }
    list.add(ElevatedButton(
      onPressed: errorPressed,
      style: errorButtonStyle ?? (buttonStyle ?? (ElevatedButton.styleFrom())),
      child: errorButtonChild ?? const Text('Tentar Novamente'),
    ));

    return list;
  }

  List<Widget> addLoadingChildren(BuildContext context) {
    final list = <Widget>[];

    list.add(
      loadingWidget ??
          SizedBox(
            height: loadingSize,
            width: loadingSize,
            child: const CircularProgressIndicator(),
          ),
    );

    if (loadingTitle != null) {
      list.add(const Gap(4));
      list.add(loadingTitle!);
    }

    return list;
  }
}

enum EEmptyState {
  none,
  withError,
  empty,
  waitingReload,
  loading,
}
