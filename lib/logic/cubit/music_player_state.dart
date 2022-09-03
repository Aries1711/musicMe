part of 'music_player_cubit.dart';

@immutable
abstract class MusicPlayerState extends Equatable {}

class MusicPlayerInitial extends MusicPlayerState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MusicPlayerPlaying extends MusicPlayerState {
  MusicDataModel musicData;
  List<MusicDataModel> musicDataList;
  int indexData;

  MusicPlayerPlaying({
    required this.musicData,
    required this.musicDataList,
    required this.indexData,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [musicData, musicDataList, indexData];
}
