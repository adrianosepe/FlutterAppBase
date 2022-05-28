part of fab_app;

abstract class EntityWebApiService extends BaseContext {
  final String host;
  final String _controllerName;
  late String _url;

  EntityWebApiService(this.host, String urlBase, this._controllerName) {
    _url = '$urlBase/$_controllerName';
  }

  String map(String action) => '$_url/$action';

  Future<TypedResult<Iterable<TModel>>> internalGetManyExecute<TModel>(String url, Func1<Map<String, dynamic>, TModel> translate) {
    return _internalDecodeMany(
      () => http.get(
        Uri.parse(url),
        headers: _getHeaders(url),
      ),
      translate,
    );
  }

  Future<TypedResult<TModel>> internalGetSingleExecute<TModel>(String url, Func1<Map<String, dynamic>, TModel> translate) {
    return _internalDecodeSingle(
      () => http.get(Uri.parse(url), headers: _getHeaders(url)),
      translate,
    );
  }

  Future<TypedResult<TModel>> internalPostSingleExecute<TModel>(String url, Map<String, dynamic>? body, Func1<Map<String, dynamic>, TModel> translate) {
    return _internalDecodeSingle(
      () => http.post(
        Uri.parse(url),
        body: body == null ? null : json.encode(body),
        headers: _getHeaders(url),
      ),
      translate,
    );
  }

  Future<Result> internalPostExecute(String url, {Map<String, dynamic>? body}) {
    return _internalDecode(
      () => http.post(
        Uri.parse(url),
        body: body == null ? null : json.encode(body),
        headers: _getHeaders(url),
      ),
    );
  }

  Future<TypedResult<TModel>> _internalDecodeSingle<TModel>(Func<Future<Response>> funcExecute, Func1<Map<String, dynamic>, TModel> translate) async {
    try {
      final response = await funcExecute();

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        print(response.body);

        var result = TypedResult<TModel>.fromMap(data, (item) => translate(item));

        return result;
      } else {
        return TypedResult.error<TModel>("Ocorreu um erro ao executar a ação desejada.");
      }
    } catch (ex) {
      return TypedResult.error<TModel>(
        'Falha ao executar este processo.',
        details: [
          ResultInfo(message: 'Verifique a Internet por favor.'),
        ],
      );
    }
  }

  Future<Result> _internalDecode<TModel>(Func<Future<Response>> funcExecute) async {
    try {
      final response = await funcExecute();

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        var result = Result.fromMap(data);

        return result;
      } else {
        return Result.error("Ocorreu um erro ao executar a ação desejada.");
      }
    } catch (ex) {
      return Result.error(
        'Falha ao executar este processo.',
        details: [
          ResultInfo(message: 'Verifique a Internet por favor.'),
        ],
      );
    }
  }

  Future<TypedResult<List<TModel>>> _internalDecodeMany<TModel>(Func<Future<Response>> funcExecute, Func1<Map<String, dynamic>, TModel> translate) async {
    try {
      final response = await funcExecute();

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        var result = TypedResult<List<TModel>>.fromMap(data, (item) {
          final items = <TModel>[];

          for (var i in item.values) {
            items.add(translate(i));
          }

          return items;
        });

        return result;
      } else {
        return TypedResult.error<List<TModel>>("Ocorreu um erro ao executar a ação desejada.");
      }
    } catch (ex) {
      return TypedResult.error<List<TModel>>(
        'Falha ao executar este processo.',
        details: [
          ResultInfo(message: 'Verifique a Internet por favor.'),
        ],
      );
    }
  }

  Map<String, String> _getHeaders(String url) {
    if (!evt.inAuthSession) {
      return {
        'Content-Type': 'application/json',
        'Host': host,
      };
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${evt.userToken}',
      'Host': host,
    };

    return headers;
  }
}
