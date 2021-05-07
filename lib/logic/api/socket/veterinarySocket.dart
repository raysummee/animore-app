import 'dart:convert';

import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/api/socket/pusher.dart';
import 'package:animore/logic/enum/bookStatusEnum.dart';
import 'package:animore/logic/enum/roleEnum.dart';
import 'package:animore/logic/helper/authenticationHelper.dart';
import 'package:animore/logic/helper/veterinaryBookHelper.dart';
import 'package:animore/logic/helper/veterinaryHelper.dart';
import 'package:animore/logic/model/modelDoctor.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:flutter_pusher_client/flutter_pusher.dart';

class VeterinarySocket{
  void onBook(){
    if(Auth().user()==null)return;

    String role = roleEnumToString(Auth().user().role);

    print("role is $role");


    if(role=="doctor"){

      Channel channel = Pusher().connection().subscribe('book-vet-${Auth().user().vetId}');

      channel.bind('App\\Events\\VetBook\\onCreateVetBook', (event) {
        print(event);
        
        ModelVetBook vetBook = ModelVetBook.fromJson(event['vetBook']);
        VeterinaryBookHelper().update(vetBook);
      });
    }else if(role=="user"){

      Channel channel = Pusher().connection().subscribe('book-vet-${Auth().user().id}');

      channel.bind('App\\Events\\VetBook\\onStatusChangeVetBook', (Map event) {
        print(event);

        print(event['vetBook']['status']);
        ModelDoctor modelDoctor = ModelDoctor.fromJson(event['vetBook']["veterinary"]);
 
        modelDoctor.status = statusEnumFromString(event['vetBook']['status']);
        VeterinaryHelper().update(modelDoctor);
      });
    }
  }
}