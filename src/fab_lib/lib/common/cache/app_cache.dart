import 'package:app_base/ex_string.dart';
import 'package:synchronized/synchronized.dart';
import 'package:vmais/models/db/app_database.dart';
import 'package:vmais/models/db/common/db_city.dart';
import 'package:vmais/models/db/common/db_device_brand.dart';
import 'package:vmais/models/db/common/db_device_model.dart';
import 'package:vmais/models/db/common/db_product.dart';
import 'package:vmais/models/db/common/db_state.dart';
import 'package:vmais/services/online_options_service.dart';

class AppCache {
  static final _instance = AppCache();

  AppDatabase _db;
  OnlineOptionsService _svc;

  final _lockProducts = Lock();
  final _lockState = Lock();
  final _lockDeviceBrands = Lock();

  static AppCache get instance => _instance;

  Future<void> beginInit() async {
    _db = await AppDatabase.get();
    _svc = OnlineOptionsService();
  }

  Future<List<DbState>> getStates() async {
    return await _lockState.synchronized(() async {
      final states = await _db.optionsRepo.getStates();

      if (states.length > 0) {
        print('States readed from db');

        return states;
      }

      print('Recovering states from API');

      var result = await _svc.getStates();
      if (!result.ok) {
        return states;
      }

      final dbsStates = List<DbState>();
      final dbsCities = List<DbCity>();

      for (final s in result.data) {
        dbsStates.add(
          DbState(
            code: s.code,
            name: s.name,
          ),
        );

        for (final c in s.cities) {
          dbsCities.add(
            DbCity(
              id: c.code,
              state: s.code,
              name: c.name,
            ),
          );
        }
      }

      await _db.optionsRepo.statesInsert(dbsStates);
      await _db.optionsRepo.citiesInsert(dbsCities);

      return await _db.optionsRepo.getStates();
    });
  }

  Future<List<DbCity>> getCities(String state) async {
    if (ExString.isNullOrEmpty(state)) {
      return [];
    }

    final cities = await _db.optionsRepo.getCities(state);
    if (cities.length > 0) {
      return cities;
    }

    await getStates();

    return await _db.optionsRepo.getCities(state);
  }

  Future<List<DbProduct>> getProducts() async {
    return await _lockProducts.synchronized(() async {
      final products = await _db.optionsRepo.getProducts();

      if (products.length > 0) {
        print('Products readed from db');

        return products;
      }

      print('Recovering products from API');

      var result = await _svc.getProducts();
      if (!result.ok) {
        return products;
      }

      final dbs = List<DbProduct>();
      for (final s in result.data) {
        dbs.add(
          DbProduct(
            id: null,
            name: s.name,
          ),
        );
      }

      await _db.optionsRepo.productsInsert(dbs);

      return await _db.optionsRepo.getProducts();
    });
  }

  Future<List<DbDeviceBrand>> getDeviceBrands() async {
    return await _lockDeviceBrands.synchronized(() async {
      final brands = await _db.optionsRepo.getDeviceBrands();

      if (brands.length > 0) {
        print('Devices brand readed from db');

        return brands;
      }

      print('Recovering devices brands from API');

      var result = await _svc.getDeviceModels();
      if (!result.ok) {
        return brands;
      }

      final distinctsBrands = Set<String>();
      for (final s in result.data) {
        distinctsBrands.add(s.brand);
      }

      for (final s in distinctsBrands) {
        await _db.optionsRepo.deviceBrandInsert(
          DbDeviceBrand(
            name: s,
          ),
        );
      }

      for (final s in result.data) {
        await _db.optionsRepo.deviceModelInsert(
          DbDeviceModel(
            id: null,
            name: s.model,
            brand: s.brand,
          ),
        );
      }

      return await _db.optionsRepo.getDeviceBrands();
    });
  }

  Future<List<DbDeviceModel>> getDeviceModels(String brand) async {
    if (ExString.isNullOrEmpty(brand)) {
      return [];
    }

    final models = await _db.optionsRepo.getDeviceModels(brand);
    if (models.length > 0) {
      return models;
    }

    await getDeviceBrands();

    return await _db.optionsRepo.getDeviceModels(brand);
  }
}
