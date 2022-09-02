// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_challenge/constants/colors.dart';
import 'package:music_app_challenge/repository/model/music_data_response_model.dart';

class BottomPlayerSheet extends StatelessWidget {
  final Duration position;
  final Duration musicLength;
  final Function onSeekMusic;
  final MusicDataModel musicData;

  BottomPlayerSheet({
    Key? key,
    required this.size,
    required this.position,
    required this.musicLength,
    required this.onSeekMusic,
    required this.musicData,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                            image: NetworkImage(musicData.albumImage),
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
                              musicData.trackTitle,
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
                              musicData.artistName,
                              maxLines: 2,
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
                            onPressed: () {},
                            icon: Icon(
                              Icons.skip_previous,
                            ),
                            color: colorWhite,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.pause_circle),
                            color: colorWhite,
                            iconSize: 32.h,
                          ),
                          IconButton(
                            onPressed: () {},
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
