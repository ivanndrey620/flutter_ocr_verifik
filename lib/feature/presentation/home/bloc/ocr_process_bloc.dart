import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'ocr_process_event.dart';
part 'ocr_process_state.dart';
part 'ocr_process_bloc.freezed.dart';

class OcrProcessBloc extends Bloc<OcrProcessEvent, OcrProcessState> {
  final Repository repository;
  final DeviceInfoPlugin deviceInfoPlugin;

  OcrProcessBloc({
    required this.repository,
    required this.deviceInfoPlugin,
  }) : super(const OcrProcessState.initial()) {
    on<GetTextFromImageEvent>((event, emit) async {
      try {
        emit(const OcrProcessState.loading());

        final OcrScanningModel ocrResult =
            await repository.getTextFromImage(droppedFile: event.droppedFile);

        // final scannedText = OcrPaser.parseResult(ocrResult);

        final WebBrowserInfo webBrowserInfo =
            await deviceInfoPlugin.webBrowserInfo;

        emit(OcrProcessState.loaded(
          ocrScanningModel: ocrResult,
          webBrowserInfo: webBrowserInfo,
        ));
      } catch (e) {
        emit(OcrProcessState.error(error: e.toString()));
      }
    });
  }
}
