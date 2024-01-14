import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class Repository {
  Future<FaceRecognitionLivenessModel> livenessDetection(
      {required XFile xFile});

  Future<OcrScanningModel> getTextFromImage({required DroppedFile droppedFile});

  Future<CompareFacesResult> compareFaces({
    required XFile xFile,
    required DroppedFile droppedFile,
  });
}
