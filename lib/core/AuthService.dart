import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';
import 'package:togg/core/GrpcServiceClient.dart';
import 'package:togg/src/generated/poi.dart';

class AuthService extends AuthenticationServiceBase{

  late LoginRequest loginRequest;

  AuthService(this.loginRequest){
    loginRequest = LoginRequest(username: loginRequest.username, password: loginRequest.password);
  }

  @override
  Future<LoginReply> login(ServerContext ctx, LoginRequest request) async{
    final userName = request.username.toString();
    final password = request.password.toString();


    return LoginReply(token: "");
  }
}
