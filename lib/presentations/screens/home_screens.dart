// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app_challenge/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  String descriptionPage;
  HomeScreen({super.key, required this.descriptionPage});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorBlack,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
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
                              decoration: InputDecoration(
                                  hintText: "Search artists or songs",
                                  hintStyle: TextStyle(
                                      fontSize: 16.sp, color: colorWhite),
                                  focusColor: Colors.transparent,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 30.h,
                            color: colorWhite,
                            onPressed: () {
                              print('haiii');
                              // widget.onSearched(_query);
                            },
                          ),
                          SizedBox(
                            width: 20.w,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: 2,
                    controller: _scrollController,
                    itemBuilder: (context, idx) {
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
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.w),
                        trailing: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: colorWhite,
                            size: 35.sp,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0.h,
                    child: Container(
                      width: size.width,
                      height: 120.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: colorWhite,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
