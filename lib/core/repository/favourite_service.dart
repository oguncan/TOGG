import 'dart:async';

import 'package:togg/core/local_data_source.dart';
import 'package:togg/src/generated/poi.dart';

abstract class IFavoriteService {
  List<PoiReply> get favourite;
  void addRemoveFavorite(PoiReply item);
  Stream<PoiReply> streamFavorite();
}

class FavouriteService extends IFavoriteService {
  final List<PoiReply> _items = [];
  final _streamController = StreamController<PoiReply>();

  @override
  void addRemoveFavorite(PoiReply item) {
    if (_items.contains(item)) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    LocalDataSource.instance.setFavourite(_items);
    _streamController.sink.add(item);
  }

  @override
  Stream<PoiReply> streamFavorite() {
    return _streamController.stream;
  }

  @override
  List<PoiReply> get favourite {
    return LocalDataSource.instance.favourites;
  }
}