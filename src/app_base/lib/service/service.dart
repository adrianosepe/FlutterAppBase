import 'dart:convert';
import 'package:app_base/events/delegates.dart';
import 'package:app_base/service/result.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class Service {
		static Map<String, String> defApplicationJsonHeaders = {
				"Content-Type": "application/json"
		};

		final String baseUrl;
    final bool inDebug;

		Service(this.baseUrl, this.inDebug);

		@protected
		String map(String urlPart) => '$baseUrl/$urlPart';

		@protected
		Future<TypedResult<List<T>>> internalGetManyExecute<T>(String url, T Function(Map<String, dynamic> tuple) funProduce) async {
				return await _internalExecuteHttpAction(() async => _internalDecodeMany<T>(await http.get(url), funProduce));
		}

		@protected
		Future<TypedResult<T>> internalPostSingleExecute<T>(String url, dynamic body, T Function(Map<String, dynamic> tuple) funProduce) async {
				return await _internalExecuteHttpAction(() async {
						final response = await http.post(
								url,
								headers: defApplicationJsonHeaders,
								body: body,
						);

						return _internalDecodeSingle(response, funProduce);
				});
		}

		@protected
		Future<TypedResult<List<T>>> internalPostManyExecute<T>(String url, dynamic body, T Function(Map<String, dynamic> tuple) funProduce) async {
				return await _internalExecuteHttpAction(() async {
						final response = await http.post(
								url,
								headers: defApplicationJsonHeaders,
								body: body,
						);

						return _internalDecodeMany<T>(response, funProduce);
				});
		}

		@protected
		Future<TypedResult<List<T>>> internalPutManyExecute<T>(String url, dynamic body, T Function(Map<String, dynamic> tuple) funProduce) async {
				return await _internalExecuteHttpAction(() async {
						final response = await http.put(
								url,
								headers: defApplicationJsonHeaders,
								body: body,
						);

						return _internalDecodeMany<T>(response, funProduce);
				});
		}

		@protected
		Future<TypedResult<List<T>>> internalDeleteManyExecute<T>(String url, Func1<Map<String, dynamic>, T> funProduce) async {
				return await _internalExecuteHttpAction(() async {
						final response = await http.delete(url);

						return _internalDecodeMany<T>(response, funProduce);
				});
		}

		Future<TypedResult<TResult>> _internalExecuteHttpAction<TResult>(Func<Future<TypedResult<TResult>>> future) async {
				try {
						return await future.call();
				} catch (Exception) {
						return TypedResult.fail('Falha ao executar este processo.', failDetail: 'Verifique a Internet por favor.');
				}
		}

		TypedResult<List<T>> _internalDecodeMany<T>(Response response, T Function(Map<String, dynamic> tuple) funProduce) {
				if (response.statusCode == 200) {
						var data = json.decode(response.body);

						var message = data["Message"];

						if (message != "SUCCESS") {
								return TypedResult.fail("Ocorreu um erro ao executar a ação desejada.");
						}

						var result = data["Result"];

						var items = List<T>();

						for (final i in result) {
							try {
								items.add(funProduce(i));
							} catch(ex) {
								print('Exception on index $i: $ex');

								if(inDebug) {
									throw ex;
								}
							}
						}

						return TypedResult.success(items);
				} else {
						return TypedResult.fail("Ocorreu um erro ao executar a ação desejada.");
				}
		}

		TypedResult<T> _internalDecodeSingle<T>(Response response, T Function(Map<String, dynamic> tuple) funProduce) {
				if (response.statusCode == 200) {
						var data = json.decode(response.body);

						var message = data["Message"];

						if (message != "SUCCESS") {
								return TypedResult.fail("Ocorreu um erro ao executar a ação desejada.");
						}

						var result = data["Result"];

						return TypedResult.success(funProduce(result));
				} else {
						return TypedResult.fail("Ocorreu um erro ao executar a ação desejada.");
				}
		}
}
