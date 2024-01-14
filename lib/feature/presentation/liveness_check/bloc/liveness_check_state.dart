part of 'liveness_check_bloc.dart';

@freezed
class LivenessCheckState with _$LivenessCheckState {
  const factory LivenessCheckState.initial() = _Initial;

  const factory LivenessCheckState.loading() = _Loading;

  const factory LivenessCheckState.loaded({
    required FaceRecognitionLivenessModel faceRecognitionLiveness,
    required CompareFacesResult compareFacesResult,
  }) = _Loaded;

  const factory LivenessCheckState.error({required String message}) = _Error;
}
