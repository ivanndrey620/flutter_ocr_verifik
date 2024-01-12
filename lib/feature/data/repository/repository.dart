import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class Repository {
  Future<OcrResultModel> getTextFromImage({required DroppedFile droppedFile});
}
