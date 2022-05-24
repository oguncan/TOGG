import 'package:grpc/grpc.dart';

class GrpcServiceClient{
  static late ClientChannel client;
  static ClientChannel getClient(){
    if(client == null){
      client = ClientChannel("http://flutterassessment.togg.cloud",
          options: ChannelOptions(credentials: ChannelCredentials.insecure(),
              idleTimeout: Duration(minutes: 1)));
    }
    return client;
  }
}