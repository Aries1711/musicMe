import 'package:flutter_test/flutter_test.dart';
import 'package:music_app_challenge/constants/api_response.dart';
import 'package:music_app_challenge/logic/cubit/music_data_cubit.dart';

void main() {
  group('MusicDataCubit', () {
    late MusicDataCubit musicDataCubit;

    setUp(() {
      musicDataCubit = MusicDataCubit();
    });

    tearDown(() {
      musicDataCubit.close();
    });

    test('test the initial state', () {
      expect(
          musicDataCubit.state, MusicDataState(musicData: const ApiResponse()));
    });
  });
}
