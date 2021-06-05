import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vmais/common/blocs/base_block.dart';

class AppBlocProvider {
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
