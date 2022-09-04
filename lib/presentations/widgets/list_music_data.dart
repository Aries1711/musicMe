// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_challenge/constants/colors.dart';
import 'package:music_app_challenge/repository/model/music_data_response_model.dart';

class ListMusicData extends StatelessWidget {
  int indexMusic;
  bool activePlaying;
  MusicDataModel dataMusic;
  VoidCallback? onPressSongSelected;

  ListMusicData({
    Key? key,
    required this.indexMusic,
    required this.dataMusic,
    required this.onPressSongSelected,
    required this.activePlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key('tapMusicList'),
      leading: CircleAvatar(
        radius: 30.h,
        // child: const Text('AS'),
        // backgroundColor: backgroundBlueSoft,
        backgroundImage: NetworkImage(dataMusic.albumImage),
      ),
      title: Text(
        dataMusic.trackTitle,
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
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        text: TextSpan(
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: colorWhite,
                fontSize: 12.sp,
              ),
            ),
            children: <TextSpan>[
              TextSpan(text: '${dataMusic.artistName} \n'),
              TextSpan(
                text: dataMusic.albumName,
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
      onTap: onPressSongSelected,
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      trailing: Padding(
        padding: const EdgeInsets.all(8.0),
        child: activePlaying
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
