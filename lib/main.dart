import 'package:animore/logic/auth/universalAuth.dart';
import 'package:animore/logic/provider/navBarIndexNotify.dart';
import 'package:animore/ux/pages/home/homeWelcomePage.dart';
import 'package:animore/ux/pages/home/navPages.dart';
import 'package:animore/ux/pages/welcome/welcomeHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  int type;
    type = 0;
  runApp(Animore(false, type));
}

class Animore extends StatelessWidget {
  // This widget is the root of your application.
  final bool showWelcome;
  final int type;
  Animore(this.showWelcome, this.type);
  @override
  Widget build(BuildContext context) {
    //forcing portait mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.cyan
      )
    );
    precacheImage(AssetImage("lib/assets/images/doctor1.jpg"), context);
    precacheImage(AssetImage("lib/assets/images/doctor2.jpg"), context);
    precacheImage(AssetImage("lib/assets/images/dog_anim_2.gif"), context);
    precacheImage(AssetImage("lib/assets/images/dog_bath.png"), context);
    precacheImage(AssetImage("lib/assets/images/dog_bone.png"), context);
    precacheImage(AssetImage("lib/assets/images/dog_food.png"), context);
    precacheImage(AssetImage("lib/assets/images/profile.png"), context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavBarIndexNotify>(create: (_)=>NavBarIndexNotify(),)
      ],
      child: MaterialApp(
        title: 'Animore',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.transparent
          )
        ),
        home: showWelcome? WelcomeHomePage() : NavPages(type),
      ),
    );
  }
}


