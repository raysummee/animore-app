import 'package:animore/logic/provider/vetBookSliderNotify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VetAppointmentSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VetBookSliderNotify>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: Stack(
            children: [
              Container(
                child: AnimatedAlign(
                  alignment: provider.index==0?Alignment.centerLeft:Alignment.centerRight, 
                  duration: Duration(milliseconds: 200),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: Colors.deepOrange,
                      width: -16+MediaQuery.of(context).size.width/2,
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: provider.index==0? Colors.white: Colors.black
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Message",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: provider.index==1? Colors.white: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            provider.index = 0;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){
                            provider.index = 1;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}