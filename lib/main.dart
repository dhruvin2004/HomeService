import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_service/auth/main_page.dart';
import 'package:home_service/scrrens/Home.dart';
import 'package:home_service/scrrens/booking.dart';
import 'package:home_service/scrrens/details.dart';
import 'package:home_service/scrrens/helpcenter.dart';
import 'package:home_service/scrrens/homePage.dart';
import 'package:home_service/scrrens/orderDone.dart';
import 'package:home_service/scrrens/profileEdit.dart';
import 'package:home_service/scrrens/providers.dart';
import 'package:home_service/scrrens/subCategory.dart';

import 'auth/intropage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: 20,
          ),
        ),
        brightness: Brightness.light,
      ),
      //initialRoute: (preferences.getBool('Intro') == true) ? 'home' : '/',
      routes: {
        '/': (context) => const SplashScreen(),
        'main': (context) => const MainPage(),
        'home': (context) => const HomePage(),
        'subCategory': (context) => const SubCategory(),
        'monthlyService': (context) => const MonthlyService(),
        'provider': (context) => const Provider(),
        'booking': (context) => const Booking(),
        'profile': (context) => const ProfileEdit(),
        'help': (context) => const HelpCenter(),
        'order': (context) => const orderDone(),
        'details': (context) => const Details(),
        'contact': (context) => const ContactUs(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
