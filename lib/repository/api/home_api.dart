import 'package:http/http.dart' as connection;
import 'package:music_app_challenge/repository/api/base_api.dart';

class HomeApi {
  Future<connection.Response> apiGetMusicData(String title) async {
    final response =
        await GETPARSE("/search?term=$title&media=music&entity=musicVideo");
    return response;
  }
}
