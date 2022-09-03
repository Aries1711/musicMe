// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_challenge/constants/colors.dart';

class WidgetStateHandling extends StatelessWidget {
  String assetsPath, message;

  WidgetStateHandling({
    Key? key,
    required this.assetsPath,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetsPath,
            width: size.width * 0.4,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colorWhite,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
