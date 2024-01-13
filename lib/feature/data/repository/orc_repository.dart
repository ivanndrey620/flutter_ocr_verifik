import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class OcrRepository {
  Future<OcrResultModel> getTextFromImage({required DroppedFile droppedFile});
}
