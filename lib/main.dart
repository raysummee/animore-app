import 'package:animore/logic/api/apiImportantEvent.dart';
import 'package:animore/logic/api/apiPet.dart';
import 'package:animore/logic/api/authentication/apiAuthentication.dart';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/api/socket/pusher.dart';
import 'package:animore/logic/api/socket/veterinarySocket.dart';
import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/provider/landingPageCarouselNotify.dart';
import 'package:animore/logic/provider/navBarIndexNotify.dart';
import 'package:animore/logic/provider/petCardEditNotify.dart';
import 'package:animore/logic/provider/vetBookSliderNotify.dart';
import 'package:animore/logic/util/hiveLoader.dart';
import 'package:animore/ux/pages/commons/startup.dart';
import 'package:animore/ux/pages/main/home/homePage.dart';
import 'package:animore/ux/pages/main/navPages.dart';
import 'package:animore/ux/pages/welcome/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveLoader().init();
  VeterinarySocket().onBook();
  navigatorKey = new GlobalKey<NavigatorState>();
  runApp(Animore());
}

class Animore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // //forcing portait mode only
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.cyan
      )
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavBarIndexNotify>(create: (_)=>NavBarIndexNotify(),),
        ChangeNotifierProvider<LandingPageCarouselNotify>(create: (_)=>LandingPageCarouselNotify()),
        ChangeNotifierProvider<PetCardEditNotify>(create: (_)=>PetCardEditNotify()),
        ChangeNotifierProvider<VetBookSliderNotify>(create: (_)=>VetBookSliderNotify())

      ],
      child: MaterialApp(
        title: 'Animore',
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.transparent
          )
        ),
        home: Startup(),
      ),
    );
  }
}


