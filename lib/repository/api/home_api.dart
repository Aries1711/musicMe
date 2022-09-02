import 'dart:convert';

import 'package:music_app_challenge/repository/api/base_api.dart';
import 'package:music_app_challenge/repository/model/music_data_response_model.dart';

class HomeApi {
  Future<MusicDataResponse> apiGetMusicData(String title) async {
    final response = await GETPARSE("/search?term=$title&media=music");
    if (response.statusCode == 200) {
      return MusicDataResponse.fromJson(jsonDecode(response.body),
          response.statusCode.toString(), 'Success get Music data');
    } else {
      return MusicDataResponse.fromJson(
          jsonDecode(response.body),
          response.statusCode.toString(),
          jsonDecode(response.body)['errorMessage']);
    }
  }
}
