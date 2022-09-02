part of 'music_data_cubit.dart';

class MusicDataState {
  final ApiResponse<List<MusicDataModel>> musicData;
  MusicDataState({
    this.musicData = const ApiResponse(),
  });

  MusicDataState copyWith({ApiResponse<List<MusicDataModel>>? musicData}) {
    return MusicDataState(
      musicData: musicData ?? this.musicData,
    );
  }
}
