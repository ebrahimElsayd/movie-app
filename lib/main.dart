import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/Search/Search.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        homeScreen.routename : (_) =>homeScreen(),
        Search.routename:(_)=>Search(),
      },
      initialRoute: homeScreen.routename,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1A1A1A),
          primary: Color(0xFF1A1A1A),
          secondary: Color(0xFF1A1A1A),
          onPrimary: Colors.white,
          onSecondary: Colors.black
        ),
        primaryColor: Color(0xFF1A1A1A),
          secondaryHeaderColor: Colors.black,
          scaffoldBackgroundColor:Colors.transparent ,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFFBAF22),
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
              size: 32
          ),
        ),
          useMaterial3: true
      ),
    );
  }
}