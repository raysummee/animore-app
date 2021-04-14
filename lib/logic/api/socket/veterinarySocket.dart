import 'dart:convert';

import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/api/socket/pusher.dart';
import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/helper/authenticationHelper.dart';
import 'package:animore/logic/helper/veterinaryHelper.dart';
import 'package:animore/logic/model/modelDoctor.dart';

class VeterinarySocket{
  void onBookVeterinary(){
    if(Auth().user()==null)return;
    var role = "user";
    if(role=="doctor"){
      Pusher().connection().subscribe('book-vet-${Auth().user().id}').bind('App\\Events\\VetBook\\onCreateVetBook', (event) {
        print(event);
        //TODO add funcs
      });
    }else if(role=="user"){
      Pusher().connection().subscribe('book-vet-${Auth().user().id}').bind('App\\Events\\VetBook\\onStatusChangeVetBook', (Map<String, dynamic> event) {
        print(event);

        print(event['vetBook']['status']);
        ModelDoctor modelDoctor = ModelDoctor.fromJson(event['vetBook']["veterinary"]);
 
        modelDoctor.status = statusEnumFromString(event['vetBook']['status']);
        VeterinaryHelper().updateOne(modelDoctor);
      });
    }
  }
}