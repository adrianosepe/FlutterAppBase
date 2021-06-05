import 'package:app_base/common/async/lazy_async.dart';
import 'package:app_base/service/service.dart';
import 'package:vmais/defaults.dart';
import 'package:vmais/models/db/app_database.dart';

abstract class BaseService extends Service {
  LazyAsync<AppDatabase> _lazyAppDatabase;

  BaseService() : super("https://www.ccovmais.com.br/api", Def.inDebug) {
    _lazyAppDatabase = LazyAsync<AppDatabase>(() => AppDatabase.get());
  }

  Future<AppDatabase> get db => _lazyAppDatabase.value;

  static Map<String, String> headersFormUrlEncoded = {"Content-Type": "application/x-www-form-urlencoded"};
}
