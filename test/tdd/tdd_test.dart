

import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:togg/common/values/storage.dart';
import 'package:togg/core/local_data_source.dart';
import 'package:togg/core/repository/repository_service.dart';
import 'package:togg/main.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/src/generated/poi.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  var favouriteService = FavouriteService();
  var authService = AuthService();

  test('Login Authentication', () async{
    await authService.login(LoginRequest(username: "Test", password: "Togg"));
    expect(MockLocalDataSource.instance.token, isNotNull);
  });

  test('Add Favourite', () async{
    favouriteService.addRemoveFavorite(PoiReply(name: 'TEST'));
    expect(MockLocalDataSource.instance.favourites.length, 1);
    expect(MockLocalDataSource.instance.favourites.first, PoiReply(name: 'TEST'));
  });


  test('Add and Delete Favourite', () async{
    PoiReply testObject = PoiReply(name: 'TEST');
    favouriteService.addRemoveFavorite(testObject);
    expect(MockLocalDataSource.instance.favourites.length, 1);
    favouriteService.addRemoveFavorite(testObject);
    expect(MockLocalDataSource.instance.favourites.length, 0);
  });
}

class MockLocalDataSource implements ILocalDataSource {
  final GetStorage _getStorage = GetStorage();
  static MockLocalDataSource? _localDataSource;
  static MockLocalDataSource get instance => _localDataSource ??= MockLocalDataSource();
  @override
  Future<void> setFavourite(List<PoiReply> items) {
    return _getStorage.write(
        FAVOURITES, jsonEncode(items.map((x) => x.writeToJson()).toList()));
  }

  @override
  List<PoiReply> get favourites {
    String? jsonString = _getStorage.read(FAVOURITES);
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
    return _getStorage.write(TOKEN, token);
  }

  @override
  String? get token => _getStorage.read(TOKEN);
}