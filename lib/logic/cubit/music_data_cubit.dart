import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'music_data_state.dart';

class MusicDataCubit extends Cubit<MusicDataState> {
  MusicDataCubit() : super(MusicDataInitial());
}
