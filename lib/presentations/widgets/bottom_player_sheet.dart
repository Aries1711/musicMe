// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_challenge/constants/colors.dart';
import 'package:music_app_challenge/repository/model/music_data_response_model.dart';

class BottomPlayerSheet extends StatelessWidget {
  final Duration position, musicLength;
  final Function onSeekMusic;
  final VoidCallback? onPressPause, onPressPrevius, onPressNext;
  final MusicDataModel musicData;
  final List<MusicDataModel> musicDataList;
  final int indexData;
  final bool playingMusic;

  BottomPlayerSheet({
    Key? key,
    required this.position,
    required this.musicLength,
    required this.onSeekMusic,
    required this.musicData,
    required this.musicDataList,
    required this.indexData,
    required this.onPressPrevius,
    required this.onPressPause,
    required this.onPressNext,
    required this.playingMusic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0.h,
      child: Visibility(
        visible: true,
        child: Container(
          width: size.width,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: colorBlackSecondary,
          ),
          child: Column(
            children: <Widget>[
              Slider.adaptive(
                  max: musicLength.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  activeColor: colorWhite,
                  inactiveColor: colorBlack,
                  onChanged: (value) {
                    onSeekMusic(value);
                  }),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 10.w,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      height: 50.h,
                      width: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        image: DecorationImage(
                            // image: AssetImage(imgPath),
                            image: NetworkImage(
                                musicDataList[indexData].albumImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              musicDataList[indexData].trackTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: colorWhite,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              musicDataList[indexData].artistName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: colorWhite,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: onPressPrevius,
                            icon: Icon(
                              Icons.skip_previous,
                            ),
                            color: colorWhite,
                          ),
                          IconButton(
                            onPressed: onPressPause,
                            icon: playingMusic == true
                                ? Icon(Icons.play_arrow)
                                : Icon(Icons.pause_circle),
                            color: colorWhite,
                            iconSize: 32.h,
                          ),
                          IconButton(
                            onPressed: onPressNext,
                            icon: Icon(Icons.skip_next),
                            color: colorWhite,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
