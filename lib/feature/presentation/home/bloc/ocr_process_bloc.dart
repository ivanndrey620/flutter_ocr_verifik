import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'ocr_process_event.dart';
part 'ocr_process_state.dart';
part 'ocr_process_bloc.freezed.dart';

class OcrProcessBloc extends Bloc<OcrProcessEvent, OcrProcessState> {
  final Repository repository;
  final ImagePickerUtil imagePickerUtil;

  OcrProcessBloc({
    required this.repository,
    required this.imagePickerUtil,
  }) : super(const OcrProcessState.initial()) {
    on<GetTextFromImageEvent>((event, emit) async {
      try {
        final xFile = await imagePickerUtil.displayPickImage();

        if (xFile != null) {
          emit(const OcrProcessState.loading());

          final OcrResultModel ocrResult =
              await repository.getTextFromImage(xFile: xFile);

          emit(OcrProcessState.loaded(ocrResult: ocrResult));
        }
      } catch (e) {
        emit(OcrProcessState.error(error: e.toString()));
      }
    });
  }
}
