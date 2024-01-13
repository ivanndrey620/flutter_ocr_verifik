import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'liveness_check_event.dart';
part 'liveness_check_state.dart';
part 'liveness_check_bloc.freezed.dart';

class LivenessCheckBloc extends Bloc<LivenessCheckEvent, LivenessCheckState> {
  final LivenesRepository livenesRepository;

  LivenessCheckBloc({required this.livenesRepository})
      : super(const LivenessCheckState.initial()) {
    on<OnLivenessCheckEvent>((event, emit) async {
      try {
        emit(const LivenessCheckState.loading());

        final livenessDetectionResult =
            await livenesRepository.livenessDetection(xFile: event.xFile);

        emit(LivenessCheckState.loaded(
            livenessDetectionResultModel: livenessDetectionResult));
      } catch (e) {
        emit(LivenessCheckState.error(message: '$e'));
      }
    });
  }
}
