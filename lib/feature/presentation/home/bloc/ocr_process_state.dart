part of 'ocr_process_bloc.dart';

@freezed
class OcrProcessState with _$OcrProcessState {
  const factory OcrProcessState.initial() = _Initial;

  const factory OcrProcessState.loading() = _Loading;

  const factory OcrProcessState.loaded({required OcrResultModel ocrResult}) =
      _Loaded;

  const factory OcrProcessState.error({required String error}) = _Error;
}
