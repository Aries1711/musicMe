import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_app_challenge/constants/api_response.dart';
import 'package:music_app_challenge/repository/api/home_api.dart';
import 'package:music_app_challenge/repository/model/music_data_response_model.dart';

part 'music_data_state.dart';

class MusicDataCubit extends Cubit<MusicDataState> {
  final _homeApi = HomeApi();
  MusicDataCubit() : super(MusicDataState());

  // setInitial() {
  //   emit(
  //     state.copyWith(
  //       musicData: const ApiResponse(),
  //     ),
  //   );
  // }

  getMusicDataByQuery(String query) async {
    emit(state.copyWith(musicData: ApiResponse.loading()));
    final responseMusicDataApi = await _homeApi.apiGetMusicData(query);
    print(responseMusicDataApi.status);
    if (responseMusicDataApi.status == "200") {
      emit(
        state.copyWith(
          musicData: ApiResponse.completed(responseMusicDataApi.data ?? []),
        ),
      );
    } else {
      emit(
        state.copyWith(
          musicData: ApiResponse.error(
              "error code: ${responseMusicDataApi.status} message: ${responseMusicDataApi.message}"),
        ),
      );
    }
  }
}
