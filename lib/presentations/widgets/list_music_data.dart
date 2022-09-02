// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_challenge/constants/colors.dart';

class ListMusicData extends StatelessWidget {
  int indexMusic;
  ListMusicData({
    Key? key,
    required this.indexMusic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30.h,
        // child: const Text('AS'),
        // backgroundColor: backgroundBlueSoft,
        backgroundImage: NetworkImage(
            "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/44/06/fd/4406fdc0-aab5-e300-82ba-3e5fe81a68a7/00602537868858.rgb.jpg/100x100bb.jpg"),
      ),
      title: Text(
        "So far Away Men",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: colorWhite,
            fontSize: 16.sp,
          ),
        ),
      ),
      subtitle: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: colorWhite,
                fontSize: 12.sp,
              ),
            ),
            children: <TextSpan>[
              TextSpan(text: 'A7X \n'),
              TextSpan(
                text: "Dear God",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: colorWhite,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ]),
      ),
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      trailing: Padding(
        padding: const EdgeInsets.all(8.0),
        child: indexMusic == 2
            ? CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: colorBlack,
              )
            : Icon(
                Icons.play_circle_fill,
                color: colorWhite,
                size: 35.sp,
              ),
      ),
    );
  }
}
