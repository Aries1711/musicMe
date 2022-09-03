import 'package:flutter_test/flutter_test.dart';
import 'package:music_app_challenge/logic/cubit/music_player_cubit.dart';

void main() {
  group("MusicPlayerCubit", () {
    late MusicPlayerCubit musicPlayerCubit;

    setUp(() {
      musicPlayerCubit = MusicPlayerCubit();
    });

    tearDown(() {
      musicPlayerCubit.close();
    });

    test("test the initial state", () {
      expect(musicPlayerCubit.state, MusicPlayerInitial());
    });
  });
}
