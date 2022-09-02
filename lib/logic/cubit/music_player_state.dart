part of 'music_player_cubit.dart';

@immutable
abstract class MusicPlayerState {}

class MusicPlayerInitial extends MusicPlayerState {}

class MusicPlayerPlaying extends MusicPlayerState {
  MusicDataModel musicData;
  List<MusicDataModel> musicDataList;
  int indexData;

  MusicPlayerPlaying({
    required this.musicData,
    required this.musicDataList,
    required this.indexData,
  });
}
