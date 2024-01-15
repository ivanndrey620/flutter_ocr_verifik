import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class RemoteDataSource {
  Future<OcrScanningModel> getTextFromImage({required DroppedFile droppedFile});

  Future<FaceRecognitionLivenessModel> livenessDetection(
      {required XFile xFile});

  Future<CompareFacesResult> compareFaces({
    required XFile xFile,
    required DroppedFile droppedFile,
  });
}
