part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.idScanning() = _IdScanning;

  const factory AppState.documentDetails({required DroppedFile droppedFile}) =
      _DocumentDetails;

  const factory AppState.livenessCheck({required DroppedFile droppedFile}) =
      _LivenessCheck;

  const factory AppState.results({
    required DroppedFile droppedFile,
    required XFile xFile,
    required WebBrowserInfo webBrowserInfo,
    required OcrScanningModel ocrScanningModel,
  }) = _Results;
}
