import 'package:animore/logic/api/apiVeterinaryBook.dart';
import 'package:animore/logic/model/modelVetBook.dart';
import 'package:animore/ux/components/card/vetAppointmentCard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DoctorMessagePage extends StatefulWidget {
  @override
  _DoctorMessagePageState createState() => _DoctorMessagePageState();
}

class _DoctorMessagePageState extends State<DoctorMessagePage> {
  Future<void> allAppointment;
  @override
  void initState() {
    allAppointment = ApiVeterinaryBook().allAppointmentAuthenticated();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: allAppointment,
      builder: (context, snapshot) {
        return ValueListenableBuilder(
          valueListenable: Hive.box<ModelVetBook>("vetBook").listenable(), 
          builder: (context, Box<ModelVetBook> box, child) {
            return box.isNotEmpty? ListView.builder(
              shrinkWrap: true,
              itemCount: box.length,
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                bottom: 160
              ),
              itemBuilder:  (context, index) {
                return VetAppointmentCard(box.getAt(index));
              }
            ):Container(
              padding: EdgeInsets.only(top: 16),
              child: Text("No bookings yet")
            );
          },
        );
      },
    );
  }
}