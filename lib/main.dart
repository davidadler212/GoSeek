import 'package:events_app/screens/nav_bar_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Events app',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        fontFamily: 'SF Pro',
        // CHANGE THEMEDATA TO FIT APP THEME
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint("An error has occurred: ${snapshot.error.toString()}");
            return Center(
              child: SizedBox(
                width: 210.0,
                child: Text(
                  "An error has occurred 🥶\nPlease send a screenshot of this screen to dga268@nyu.edu\n${snapshot.error.toString()}",
                  style: const TextStyle(
                    color: Color(0xFF106BAD),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasData == true){
            return const NavBarWrapper();
          } else {
            return const Center(
              child: SpinKitPumpingHeart(
                color: Colors.white,
                size: 50.0,
              ),
            );
          }
        },
        ),
      );
  }
}