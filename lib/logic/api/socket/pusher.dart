import 'package:flutter_pusher_client/flutter_pusher.dart';

class Pusher{
  //One instance, needs factory
  static Pusher _instance;
  factory Pusher() => _instance ??= new Pusher._();

  static FlutterPusher _pusher;

  Pusher._(){
    _initPusher();
  }
  //
  
  static void _initPusher(){
    print("init pusher");
    PusherOptions options = PusherOptions(
      host: '0.0.0.0',
      port: 6001,
      cluster: "mt1",
      encrypted: false,
    );
    _pusher = FlutterPusher('12345', options, enableLogging: true, onConnectionStateChange: (connectionStateChange){
      print(connectionStateChange.currentState);
    });
  }

  FlutterPusher connection(){
    return _pusher;
  }

}