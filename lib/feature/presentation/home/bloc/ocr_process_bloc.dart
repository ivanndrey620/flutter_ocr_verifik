import 'package:flutter_ocr_verifik/feature/domain/scanned_text_model.dart';
import 'package:flutter_ocr_verifik/utils/export_files.dart';
import 'package:flutter_ocr_verifik/utils/ocr_parser.dart';

part 'ocr_process_event.dart';
part 'ocr_process_state.dart';
part 'ocr_process_bloc.freezed.dart';

class OcrProcessBloc extends Bloc<OcrProcessEvent, OcrProcessState> {
  final OcrRepository ocrRepository;

  OcrProcessBloc({
    required this.ocrRepository,
  }) : super(const OcrProcessState.initial()) {
    on<GetTextFromImageEvent>((event, emit) async {
      try {
        emit(const OcrProcessState.loading());

        final OcrResultModel ocrResult = await ocrRepository.getTextFromImage(
            droppedFile: event.droppedFile);

        final scannedText = OcrPaser.parseResult(ocrResult);

        emit(OcrProcessState.loaded(scannedText: scannedText));
      } catch (e) {
        emit(OcrProcessState.error(error: e.toString()));
      }
    });
  }
}
