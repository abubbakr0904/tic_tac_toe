import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/screens/tic_tac_toe_screen/tic_tac_toe_screen.dart';
import 'package:tic_tac_toe/utils/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(AppImages.homePageImage,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TicTacToeScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 300.h),
                padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Text(
                  "Let’s play",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
