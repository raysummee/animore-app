import 'package:flutter_pusher_client/flutter_pusher.dart';

class Pusher{
  //One instance, needs factory
  static Pusher _instance;
  factory Pusher() => _instance ??= new Pusher._();

  static FlutterPusher _pusher;

  Pusher._(){
    _init();
  }
  //
  
  static void _init(){
    print("init pusher");
    PusherOptions options = PusherOptions(
      cluster: "ap2",
    );
    _pusher = FlutterPusher('19c58a49eb2e09c65327', options, enableLogging: true, onConnectionStateChange: (connectionStateChange){
      print(connectionStateChange.currentState);
    });
  }

  FlutterPusher connection(){
    return _pusher;
  }

}