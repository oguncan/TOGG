import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:togg/src/generated/poi.dart';

abstract class ILocalDataSource {
  Future setFavorite(List<PoiReply> items);
  List<PoiReply> get favorities;

  Future setToken(String token);
  String? get token;
}

class LocalDataSource implements ILocalDataSource {
  final GetStorage _getStorage = GetStorage();
  static LocalDataSource? _localDataSource;
  static LocalDataSource get instance => _localDataSource ??= LocalDataSource();
  @override
  Future<void> setFavorite(List<PoiReply> items) {
    return _getStorage.write(
        "favorite", jsonEncode(items.map((x) => x.writeToJson()).toList()));
  }

  @override
  List<PoiReply> get favorities {
    String? jsonString = _getStorage.read("favorite");
    if (jsonString != null) {
      try {
        return List<PoiReply>.from(
            jsonDecode(jsonString).map((x) => PoiReply.fromJson(x)));
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }

  @override
  Future<void> setToken(String? token) {
    return _getStorage.write("Token", token);
  }

  @override
  String? get token => _getStorage.read("Token");
}