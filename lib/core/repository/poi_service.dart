import 'package:grpc/grpc.dart';
import 'package:togg/core/grpc_service_client.dart';
import 'package:togg/core/local_data_source.dart';
import 'package:togg/src/generated/poi.dart';

abstract class IPoiService {
  Stream<PoiReply> getPois();
}

class PoiService extends IPoiService {
  @override
  Stream<PoiReply> getPois() {
    return PoiLocatorClient(GrpcClient.channel,
        options: CallOptions(
          timeout: const Duration(seconds: 15),
          metadata: {
            'content-type': 'application/grpc',
            'Authorization': 'Bearer ' + (LocalDataSource.instance.token ?? "")
          },
        )).getPois(PoiRequest());
  }
}