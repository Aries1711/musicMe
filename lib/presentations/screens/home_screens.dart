// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:music_app_challenge/constants/colors.dart';
import 'package:music_app_challenge/presentations/widgets/appbar_search.dart';
import 'package:music_app_challenge/presentations/widgets/bottom_player_sheet.dart';
import 'package:music_app_challenge/presentations/widgets/list_music_data.dart';

class HomeScreen extends StatefulWidget {
  String descriptionPage;
  HomeScreen({super.key, required this.descriptionPage});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

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
              child: AppbarSearch(size: size),
            ),
            Expanded(
              flex: 9,
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: 3,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return ListMusicData(
                        indexMusic: index,
                      );
                    },
                  ),
                  BottomPlayerSheet(size: size),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
