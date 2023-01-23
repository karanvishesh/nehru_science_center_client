import 'package:flutter/material.dart';
import 'package:nehru_science_center_client/Screen/BookingPage/booking_page.dart';
import 'package:nehru_science_center_client/Screen/BottomNavBar/bottom_navbar.dart';
import 'package:nehru_science_center_client/Screen/DetailPage/detail_page.dart';
import 'package:nehru_science_center_client/Screen/HomePage/homepage.dart';
import 'package:nehru_science_center_client/Screen/LoginPage/enter_phone.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.montserratTextTheme(),
            primarySwatch: Colors.grey,
          ),
          home: EnterPhone());
    });
  }
}
