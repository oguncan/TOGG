import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';
import 'package:togg/pages/pages.dart';
import 'package:togg/src/generated/poi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_macos/path_provider_macos.dart';

import '../../core/mock_core_repository.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MockFavouriteService mockFavouriteService = MockFavouriteService();
  late MockLocalDataSource dataSource;

  MockAuthService mockAuthService = MockAuthService();
  MockPoiService mockPoiService = MockPoiService();

  PoiReply testPoiObject = PoiReply(name: 'TEST');


  setUp(() async {
    dataSource = MockLocalDataSource();
    dataSource.init();
  });


  test('DELETE FAVOURİTE', () async {
    mockFavouriteService.addRemoveFavorite(testPoiObject);
    expect(dataSource.favourites.length, 1);
    mockFavouriteService.addRemoveFavorite(testPoiObject);
    expect(dataSource.favourites.length, 0);
  });

}


