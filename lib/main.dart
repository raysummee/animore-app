import 'package:animore/logic/api/apiImportantEvent.dart';
import 'package:animore/logic/api/apiPet.dart';
import 'package:animore/logic/api/authentication/apiAuthentication.dart';
import 'package:animore/logic/api/authentication/auth.dart';
import 'package:animore/logic/helper/todosHelper.dart';
import 'package:animore/logic/provider/navBarIndexNotify.dart';
import 'package:animore/logic/util/hiveLoader.dart';
import 'package:animore/ux/pages/main/home/homePage.dart';
import 'package:animore/ux/pages/main/navPages.dart';
import 'package:animore/ux/pages/welcome/welcomeHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveLoader().init();
  runApp(Animore());
}

class Animore extends StatelessWidget {
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
        home: NavPages(),
      ),
    );
  }
}


