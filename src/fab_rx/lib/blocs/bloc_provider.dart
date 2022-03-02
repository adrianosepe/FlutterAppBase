part of fab_rx;

class BlocProvider {
  static TBlock init<TBlock extends BaseBloc>(BuildContext context) {
    final bloc = Provider.of<TBlock>(context, listen: false);

    bloc.init();

    return bloc;
  }

  static TBlock of<TBlock extends BaseBloc>(BuildContext context) {
    final bloc = Provider.of<TBlock>(context);

    return bloc;
  }
}
