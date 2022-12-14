// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_challenge/constants/colors.dart';

class AppbarSearch extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback? onPressSearch;
  final TextEditingController searchTextController;

  AppbarSearch({
    Key? key,
    required this.size,
    required this.onChanged,
    required this.onSubmitted,
    required this.onPressSearch,
    required this.searchTextController,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      color: colorBlack,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "MusicMe",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: colorWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            decoration: BoxDecoration(
              color: colorBlackSecondary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color(0XFFFFFFFF),
                    ),
                    textAlign: TextAlign.center,
                    controller: searchTextController,
                    decoration: InputDecoration(
                      hintText: "Search artists or songs",
                      hintStyle: TextStyle(fontSize: 16.sp, color: colorWhite),
                      focusColor: Colors.transparent,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    onChanged: onChanged,
                    onSubmitted: onSubmitted,
                    textInputAction: TextInputAction.search,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30.h,
                  color: colorWhite,
                  onPressed: onPressSearch,
                ),
                SizedBox(
                  width: 20.w,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
