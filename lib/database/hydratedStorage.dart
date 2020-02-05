import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sembast/sembast.dart';
import 'dart:convert';

import 'database.dart';

class MYHydratedStorage implements HydratedStorage {
  static MYHydratedStorage _instance;
  Map<String, String> _storage;

  static Future<MYHydratedStorage> getInstance() async {
    if (_instance != null) {
      return _instance;
    }
    Map<String, String> storage = {};
    var store = stringMapStoreFactory.store("blocs");
    List<RecordSnapshot> list = await store.find(DataBase.db);
    for (var r in list) {
      storage[r.key] = json.encode(r.value);
    }

    _instance = MYHydratedStorage._(storage);
    return _instance;
  }

  MYHydratedStorage._(this._storage);

  @override
  dynamic read(String key) {
    return this._storage[key];
  }

  @override
  Future<void> write(String key, dynamic value) async {
    this._storage[key] = value;
    var store = stringMapStoreFactory.store("blocs");
    store.record(key).put(DataBase.db, json.decode(value));
  }

  @override
  Future<void> delete(String key) async {
    this._storage.remove(key);
    var store = stringMapStoreFactory.store("blocs");
    store.record(key).delete(DataBase.db);
  }

  @override
  Future<void> clear() async {
    this._storage.clear();
    var store = stringMapStoreFactory.store("blocs");
    await store.drop(DataBase.db);
  }
}