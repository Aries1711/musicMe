part of 'music_data_cubit.dart';

class MusicDataState extends Equatable {
  final ApiResponse<List<MusicDataModel>> musicData;
  MusicDataState({
    this.musicData = const ApiResponse(),
  });

  MusicDataState copyWith({ApiResponse<List<MusicDataModel>>? musicData}) {
    return MusicDataState(
      musicData: musicData ?? this.musicData,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [musicData];
}
