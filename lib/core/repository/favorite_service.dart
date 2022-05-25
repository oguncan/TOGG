import 'dart:async';

import 'package:togg/core/local_data_source.dart';
import 'package:togg/src/generated/poi.dart';

abstract class IFavoriteService {
  List<PoiReply> get favorite;
  void addRemoveFavorite(PoiReply item);
  Stream<PoiReply> streamFavorite();
}

class FavoriteService extends IFavoriteService {
  final List<PoiReply> _items = [];
  final _streamController = StreamController<PoiReply>();

  @override
  void addRemoveFavorite(PoiReply item) {
    if (_items.contains(item)) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    LocalDataSource.instance.setFavorite(_items);
    _streamController.sink.add(item);
  }

  @override
  Stream<PoiReply> streamFavorite() {
    return _streamController.stream;
  }

  @override
  List<PoiReply> get favorite {
    return LocalDataSource.instance.favorities;
  }
}