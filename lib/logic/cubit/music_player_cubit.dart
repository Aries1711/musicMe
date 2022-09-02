import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_app_challenge/repository/model/music_data_response_model.dart';

part 'music_player_state.dart';

class MusicPlayerCubit extends Cubit<MusicPlayerState> {
  MusicPlayerCubit() : super(MusicPlayerInitial());

  void startPlay(MusicDataModel musicData, List<MusicDataModel> musicDataList,
      int indexData) async {
    emit(
      MusicPlayerPlaying(
          musicData: musicData,
          musicDataList: musicDataList,
          indexData: indexData),
    );
  }

  void completePlay() {
    emit(MusicPlayerInitial());
  }
}
