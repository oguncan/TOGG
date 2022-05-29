
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:togg/core/repository/repository_service.dart';
import 'package:togg/pages/pages.dart';

GetIt locator = GetIt.instance;
setupLocator() {
  locator.registerSingleton(() => ClientChannel(
      "http://flutterassessment.togg.cloud",
      options:
      const ChannelOptions(credentials: ChannelCredentials.insecure())));
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => FavouriteService());
  locator.registerLazySingleton(() => PoiService());

  locator.registerFactory(() => LoginController());
  locator.registerFactory(() => HomeController());
  locator
      .registerFactory(() => FavouriteController());
}