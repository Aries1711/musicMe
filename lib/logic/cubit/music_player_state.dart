part of 'music_player_cubit.dart';

@immutable
abstract class MusicPlayerState {}

class MusicPlayerInitial extends MusicPlayerState {}

class MusicPlayerPlaying extends MusicPlayerState {
  MusicDataModel musicData;

  MusicPlayerPlaying({
    required this.musicData,
  });
}
