// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_challenge/constants/api_response.dart';
import 'package:music_app_challenge/constants/colors.dart';
import 'package:music_app_challenge/logic/cubit/music_data_cubit.dart';
import 'package:music_app_challenge/logic/cubit/music_player_cubit.dart';
import 'package:music_app_challenge/presentations/widgets/appbar_search.dart';
import 'package:music_app_challenge/presentations/widgets/bottom_player_sheet.dart';
import 'package:music_app_challenge/presentations/widgets/list_music_data.dart';
import 'package:music_app_challenge/presentations/widgets/widget_state_handling.dart';

class HomeScreen extends StatefulWidget {
  String descriptionPage;
  HomeScreen({super.key, required this.descriptionPage});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final blocMusicData = MusicDataCubit();
  final blocMusicPlayer = MusicPlayerCubit();
  bool playingMusic = false;
  String oldValue = '';
  Timer? timer;
  final AudioPlayer _player = AudioPlayer();
  Duration _position = Duration();
  Duration _musicLength = Duration();

  void _onSearchChanged() {
    if (searchController.text != '' && oldValue != searchController.text) {
      timer = Timer(const Duration(milliseconds: 2000), () async {
        timer?.cancel();
        await blocMusicData.getMusicDataByQuery(searchController.text);
        oldValue = searchController.text;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      _onSearchChanged();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: colorBlack,
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: AppbarSearch(
                  size: size,
                  searchTextController: searchController,
                  onChanged: (value) {},
                  onSubmitted: (value) async {
                    await blocMusicData.getMusicDataByQuery(value);
                  },
                  onPressSearch: () async {
                    await blocMusicData
                        .getMusicDataByQuery(searchController.text);
                  },
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  child: BlocConsumer<MusicPlayerCubit, MusicPlayerState>(
                    bloc: blocMusicPlayer,
                    listener: (context, state) async {
                      if (state is MusicPlayerPlaying) {
                        await _player
                            .play(UrlSource(state.musicData.trackPreview));
                        _player.onDurationChanged.listen((Duration p) {
                          setState(() {
                            _musicLength = p;
                          });
                        });
                        _player.onPositionChanged.listen((Duration p) {
                          setState(() {
                            _position = p;
                          });
                        });
                        _player.onPlayerComplete.listen((event) {
                          blocMusicPlayer.completePlay();
                        });
                      }
                    },
                    builder: (context, state) {
                      return Stack(
                        children: <Widget>[
                          BlocBuilder<MusicDataCubit, MusicDataState>(
                            bloc: blocMusicData,
                            buildWhen: (previus, current) =>
                                previus.musicData != current.musicData,
                            builder: (context, stateData) {
                              switch (stateData.musicData.status) {
                                case Status.INITIAL:
                                  return WidgetStateHandling(
                                    assetsPath: "assets/images/podcast.png",
                                    message: "Let's start find songs",
                                  );
                                case Status.LOADING:
                                  return WidgetStateHandling(
                                    assetsPath: "assets/images/podcast.png",
                                    message: "Please wait...",
                                  );
                                case Status.COMPLETED:
                                  final data = stateData.musicData.data ?? [];
                                  if (data.isNotEmpty) {
                                    return ListView.builder(
                                      itemCount: data.length,
                                      controller: _scrollController,
                                      itemBuilder: (context, index) {
                                        return ListMusicData(
                                          indexMusic: index,
                                          activePlaying: (() {
                                            if (state is MusicPlayerPlaying &&
                                                state.musicData.trackPreview ==
                                                    stateData
                                                        .musicData
                                                        .data![index]
                                                        .trackPreview) {
                                              return true;
                                            } else {
                                              return false;
                                            }
                                          }()),
                                          dataMusic:
                                              stateData.musicData.data![index],
                                          onPressSongSelected: () =>
                                              blocMusicPlayer.startPlay(
                                                  stateData
                                                      .musicData.data![index],
                                                  stateData.musicData.data!,
                                                  index),
                                        );
                                      },
                                    );
                                  } else {
                                    return WidgetStateHandling(
                                        assetsPath:
                                            "assets/images/error_data.png",
                                        message:
                                            "Sorry we can find anything..");
                                  }
                                case Status.ERROR:
                                  return WidgetStateHandling(
                                      assetsPath:
                                          "assets/images/error_data.png",
                                      message: stateData.musicData.message!);
                                default:
                                  return WidgetStateHandling(
                                    assetsPath: "assets/images/podcast.png",
                                    message: "Let's start find songs",
                                  );
                              }
                            },
                          ),
                          (() {
                            if (state is MusicPlayerPlaying) {
                              return BottomPlayerSheet(
                                  position: _position,
                                  musicLength: _musicLength,
                                  onPressNext: () {
                                    if (state.indexData <
                                        state.musicDataList.length) {
                                      blocMusicPlayer.startPlay(
                                          state.musicDataList[
                                              state.indexData + 1],
                                          state.musicDataList,
                                          state.indexData + 1);
                                    }
                                  },
                                  onPressPrevius: () {
                                    if (state.indexData >= 1) {
                                      blocMusicPlayer.startPlay(
                                          state.musicDataList[
                                              state.indexData - 1],
                                          state.musicDataList,
                                          state.indexData - 1);
                                    }
                                  },
                                  musicDataList: state.musicDataList,
                                  indexData: state.indexData,
                                  playingMusic: playingMusic,
                                  onPressPause: () {
                                    if (playingMusic) {
                                      _player.resume();
                                    } else {
                                      _player.pause();
                                    }
                                    setState(() {
                                      playingMusic = !playingMusic;
                                    });
                                  },
                                  musicData: state.musicData,
                                  onSeekMusic: (value) {
                                    int valueInt = value.round();
                                    Duration newPos =
                                        Duration(seconds: valueInt);
                                    _player.seek(newPos);
                                  });
                            } else {
                              return Container();
                            }
                          }())
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
