import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';
import 'package:togg/core/grpc_service_client.dart';
import 'package:togg/core/local_data_source.dart';
import 'package:togg/src/generated/poi.dart';

abstract class IAuthService {
  Future<LoginReply> login(LoginRequest request);
}

class AuthService implements IAuthService {
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
