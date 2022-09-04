import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_app_challenge/logic/cubit/music_data_cubit.dart';
import 'package:music_app_challenge/logic/cubit/music_player_cubit.dart';
import 'package:music_app_challenge/presentations/widgets/list_music_data.dart';
import 'package:music_app_challenge/repository/model/music_data_response_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Widget makeTestableWidget({required Widget childWidget}) {
    return MaterialApp(
        title: 'Music app with bloc',
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child ?? Container(),
          );
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScreenUtilInit(
          designSize: const Size(376, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: ((context, child) {
            return Container(
              height: 600,
              width: 400,
              child: childWidget,
            );
          }),
        ));
  }

  Duration _musicLength, _position;
  final ScrollController _scrollController = ScrollController();
  // initialize value for model, widget and player
  MusicDataModel musicDataSong = MusicDataModel(
    trackId: 266024329,
    trackTitle: 'Afterlife',
    artistName: 'Avenged Sevenfold',
    albumName: 'Avenged Sevenfold (Bonus Track Version)',
    albumImage:
        'https://is3-ssl.mzstatic.com/image/thumb/Features124/v4/45/ab/b7/45abb7a5-6a53-8d8f-91b0-03d1ef93111e/dj.zzffiuki.jpg/100x100bb.jpg',
    trackPreview:
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/55/d0/80/55d08099-0daf-8987-0362-13e8fca40ceb/mzaf_5359610215799095923.plus.aac.p.m4a',
  );
  MusicDataModel musicDataDummy = MusicDataModel(
    trackId: 0,
    trackTitle: '',
    artistName: '',
    albumName: '',
    albumImage: '',
    trackPreview: '',
  );

  group("Music Data Model Widget and player", () {
    AudioPlayer _player = AudioPlayer();
    bool isPlaying = false;

    ListMusicData dummyMusicList = ListMusicData(
      indexMusic: 1,
      dataMusic: musicDataDummy,
      onPressSongSelected: () {},
      activePlaying: isPlaying,
    );

    ListMusicData realMusicList = ListMusicData(
      indexMusic: 1,
      dataMusic: musicDataSong,
      onPressSongSelected: () async {
        await _player.play(UrlSource(musicDataSong.trackPreview));
      },
      activePlaying: isPlaying,
    );

    test("1. test model constructor", () {
      expect(musicDataSong.artistName, equals('Avenged Sevenfold'));
      expect(musicDataDummy.artistName, equals(''));
    });

    test("2. test widget list music", () {
      expect(realMusicList.dataMusic, musicDataSong);
      expect(dummyMusicList.dataMusic, musicDataDummy);
    });

    // testWidgets("3. Build widget", (WidgetTester tester) async {
    //   await tester.pumpWidget(
    //     makeTestableWidget(
    //       childWidget: ListView.builder(
    //         itemCount: 1,
    //         shrinkWrap: true,
    //         controller: _scrollController,
    //         itemBuilder: (context, index) {
    //           return realMusicList;
    //         },
    //       ),
    //     ),
    //   );
    //   // the loading should be success
    // });

    // testWidgets("4. AudioPlayer test play on widget that was build",
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(
    //     makeTestableWidget(
    //       child: ListView.builder(
    //         itemCount: 1,
    //         controller: _scrollController,
    //         itemBuilder: (context, index) {
    //           return realMusicList;
    //         },
    //       ),
    //     ),
    //   );
    //   await tester.tap(find.byKey(
    //     Key('tapMusicLists'),
    //   ));

    //   await tester.pump();

    //   expect(isPlaying, isNot(equals(null)));
    //   // the player should be success
    // });
  });
}
