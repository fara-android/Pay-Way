import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/splash/splash_screen.dart';
import 'package:wallet_ui/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // name: 'PayWay',
      // options: FirebaseOptions(
      //   storageBucket: 'kg.atlas.payway',
      //   apiKey: 'AIzaSyDG2_9Dh2lr5d9itK_edtEEyi96_scg9d0',
      //   appId: '1:16910142796:android:8f5e9dec973a9a1ccc13e9',
      //   messagingSenderId: '16910142796',
      //   projectId: 'payway-dc274',
      // ),
      );

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Styles.backgroundColor2,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
      ),
      home: SplashScreen(),
    );
  }
}














// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wallet_ui/presentation/screens/history_screen/history_screen.dart';
// import 'package:wallet_ui/presentation/screens/home_screen/home_screen.dart';
// import 'package:wallet_ui/presentation/screens/main_screen.dart';
// import 'package:wallet_ui/presentation/screens/payments_screen/payments_screen.dart';
// import 'package:wallet_ui/presentation/screens/sign_in_screen/sign_in_screens/main_sign_in_screen.dart';

//   void main() {
//     runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: SharedPreferences.getInstance(),
//         builder:
//             (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
//           var x = prefs.data;
//           if (prefs.hasData) {
//             if (x?.getBool('isLoggedIn') ?? false) {
//                 return  MaterialApp(
//                     title: 'Pay Way',
                    // theme: ThemeData(
                    //   primarySwatch: Colors.blue,
                    //     appBarTheme: const AppBarTheme(
                    //         systemOverlayStyle: SystemUiOverlayStyle(
                    //             statusBarColor: Colors.transparent
                    //         )
                    //     )
                    // ),
//                     home: const MainScreen()
//                 );
//             }
//           }
//           return  MaterialApp(
//               title: 'Pay Way',
//               theme: ThemeData(
//                   primarySwatch: Colors.blue,
//                   appBarTheme: const AppBarTheme(
//                       systemOverlayStyle: SystemUiOverlayStyle(
//                           statusBarColor: Colors.transparent
//                       )
//                   )
//               ),
//               home: const MainSignInScreen()
//           );
//         });
//   }
// }
