import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';
import 'package:togg/src/generated/poi.dart';

class GrpcClient {
  static ClientChannel? _channel;
  static ClientChannel get channel {
    _channel ??= ClientChannel("flutterassessment.togg.cloud",
        port: 80,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          idleTimeout: Duration(minutes: 1),
        ));
    return _channel!;
  }
}