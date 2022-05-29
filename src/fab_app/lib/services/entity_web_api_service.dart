part of fab_app;

abstract class EntityWebApiService extends BaseContext {
  final String host;
  final String _controllerName;
  late String _url;

  EntityWebApiService(this.host, String urlBase, this._controllerName) {
    _url = '$urlBase/$_controllerName';
  }

  String get url => _url;
  String map(String action) => '$_url/$action';

  Future<TypedResult<Iterable<TModel>>> internalGetManyExecute<TModel>(String url, Func1<Map<String, dynamic>, TModel> translate, {String? token}) {
    return _internalDecodeMany(
      () => http.get(
        Uri.parse(url),
        headers: _getHeaders(url, token: token ?? evt.authToken),
      ),
      translate,
    );
  }

  Future<TypedResult<TModel>> internalGetSingleExecute<TModel>(String url, Func1<Map<String, dynamic>, TModel> translate, {String? token}) {
    return _internalDecodeSingle(
      () => http.get(
        Uri.parse(url),
        headers: _getHeaders(url, token: token ?? evt.authToken),
      ),
      translate,
    );
  }

  Future<TypedResult<TModel>> internalPostSingleExecute<TModel>(String url, Map<String, dynamic>? body, Func1<Map<String, dynamic>, TModel> translate, {String? token}) {
    return _internalDecodeSingle(
      () => http.post(
        Uri.parse(url),
        body: body == null ? null : json.encode(body),
        headers: _getHeaders(url, token: token ?? evt.authToken),
      ),
      translate,
    );
  }

  Future<TypedResult<TModel>> internalPathSingleExecute<TModel>(String url, Func1<Map<String, dynamic>, TModel> translate, {String? token}) {
    return _internalDecodeSingle(
      () => http.patch(
        Uri.parse(url),
        headers: _getHeaders(url, token: token ?? evt.authToken),
      ),
      translate,
    );
  }

  Future<Result> internalPostExecute(String url, {Map<String, dynamic>? body, String? token}) {
    return _internalDecode(
      () => http.post(
        Uri.parse(url),
        body: body == null ? null : json.encode(body),
        headers: _getHeaders(url, token: token ?? evt.authToken),
      ),
    );
  }

  Future<Result> internalPutExecute(String url, {Map<String, dynamic>? body, String? token}) {
    return _internalDecode(
      () => http.put(
        Uri.parse(url),
        body: body == null ? null : json.encode(body),
        headers: _getHeaders(url, token: token ?? evt.authToken),
      ),
    );
  }

  Future<Result> internalPathExecute(String url, {Map<String, dynamic>? body, String? token}) {
    return _internalDecode(
      () => http.patch(
        Uri.parse(url),
        body: body == null ? null : json.encode(body),
        headers: _getHeaders(url, token: token ?? evt.authToken),
      ),
    );
  }

  Future<Result> internalPostFormMultipartExecute(String url, {List<MultipartFile>? files, Map<String, String>? body, String? token}) {
    return _internalDecode(() async {
      final request = http.MultipartRequest('POST', Uri.parse(url));

      if (body != null) {
        request.fields.addAll(body);
      }

      request.files.addAll(files ?? []);

      final headers = _getHeaders(
        url,
        contentType: 'application/x-www-form-urlencoded',
        token: token ?? evt.authToken,
      );
      request.headers.addAll(headers);

      final streamedResponse = await request.send();
      return http.Response.fromStream(streamedResponse);
    });
  }

  Future<TypedResult<TModel>> _internalDecodeSingle<TModel>(Func<Future<Response>> funcExecute, Func1<Map<String, dynamic>, TModel> translate) async {
    try {
      if (!await _tryOverNetwork()) {
        return TypedResult.error('Falta de conectividade, por favor verifique a Internet.');
      }

      final response = await funcExecute();

      if (response.statusCode == 200 || response.statusCode == 400) {
        var data = json.decode(response.body);

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
      if (!await _tryOverNetwork()) {
        return Result.error('Falta de conectividade, por favor verifique a Internet.');
      }

      final response = await funcExecute();

      if (response.statusCode == 200 || response.statusCode == 400) {
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
      if (!await _tryOverNetwork()) {
        return TypedResult.error('Falta de conectividade, por favor verifique a Internet.');
      }

      final response = await funcExecute();

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        var result = TypedResult.fromList<TModel>(
          data,
          (item) {
            final items = <TModel>[];

            for (var i in item) {
              items.add(translate(i as Map<String, dynamic>));
            }

            return items;
          },
        );

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

  Map<String, String> _getHeaders(String url, {String contentType = 'application/json', String? token}) {
    if (token == null) {
      return {
        'Content-Type': contentType,
        'Host': host,
      };
    }

    Map<String, String> headers = {
      'Content-Type': contentType,
      'Host': host,
      'Authorization': 'Bearer $token',
    };

    return headers;
  }

  static Future<bool> _tryOverNetwork() async {
    var result = await Connectivity().checkConnectivity();

    return result == ConnectivityResult.none ? false : true;
  }
}
