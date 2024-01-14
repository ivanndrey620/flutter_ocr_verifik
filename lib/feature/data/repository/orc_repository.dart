import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class OcrRepository {
  Future<OcrScanningModel> getTextFromImage({required DroppedFile droppedFile});
}
