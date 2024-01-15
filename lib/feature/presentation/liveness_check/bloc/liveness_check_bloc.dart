import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'liveness_check_event.dart';
part 'liveness_check_state.dart';
part 'liveness_check_bloc.freezed.dart';

class LivenessCheckBloc extends Bloc<LivenessCheckEvent, LivenessCheckState> {
  final Repository repository;

  LivenessCheckBloc({required this.repository})
      : super(const LivenessCheckState.initial()) {
    on<OnLivenessCheckEvent>((event, emit) async {
      try {
        emit(const LivenessCheckState.loading());

        final faceRecognitionLiveness =
            await repository.livenessDetection(xFile: event.xFile);

        final compareFaces = await repository.compareFaces(
          xFile: event.xFile,
          droppedFile: event.droppedFile,
        );

        emit(LivenessCheckState.loaded(
          faceRecognitionLiveness: faceRecognitionLiveness,
          compareFacesResult: compareFaces,
        ));
      } catch (e) {
        emit(LivenessCheckState.error(message: '$e'));
      }
    });
  }
}
