import 'dart:async';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:mockito/mockito.dart';
import 'package:togg/common/values/storage.dart';
import 'package:togg/core/grpc_service_client.dart';
import 'package:togg/core/local_data_source.dart';
import 'package:togg/core/repository/repository_service.dart';
import 'package:togg/src/generated/poi.dart';

class MockLocalDataSource implements ILocalDataSource {
  final GetStorage _getStorage = GetStorage();
  static MockLocalDataSource? _localDataSource;
  static MockLocalDataSource get instance => _localDataSource ??= MockLocalDataSource();

  Future init() async {
    await GetStorage.init();
  }

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

class MockFavouriteService extends Mock implements IFavoriteService {
  final List<PoiReply> _items = [];
  final _streamController = StreamController<PoiReply>();

  @override
  void addRemoveFavorite(PoiReply item) {
    if (_items.contains(item)) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    MockLocalDataSource.instance.setFavourite(_items);
    _streamController.sink.add(item);
  }

  @override
  Stream<PoiReply> streamFavorite() {
    return _streamController.stream;
  }

  @override
  List<PoiReply> get favourite {
    return MockLocalDataSource.instance.favourites;
  }

  @override
  bool isThereFavourite(PoiReply item) {
    if (_items.contains(item)) {
      return true;
    } else {
      return false;
    }
  }
}

class MockAuthService extends Mock implements IAuthService {
  @override
  Future<LoginReply> login(LoginRequest request) async {
    var res = await AuthenticationClient(GrpcClient.channel,
        options: CallOptions(
          timeout: const Duration(seconds: 15),
          metadata: {'content-type': 'application/grpc'},
        )).login(request);
    return res;
  }
}

class MockPoiService extends Mock implements IPoiService {
  @override
  Stream<PoiReply> getPois() {
    return PoiLocatorClient(GrpcClient.channel,
        options: CallOptions(
          timeout: const Duration(seconds: 15),
          metadata: {
            'content-type': 'application/grpc',
            'Authorization': 'Bearer ' + (MockLocalDataSource.instance.token ?? "")
          },
        )).getPois(PoiRequest());
  }
}