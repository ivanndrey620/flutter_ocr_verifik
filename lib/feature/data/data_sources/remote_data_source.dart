import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class RemoteDataSource {
  Future<OcrScanningModel> getTextFromImage({required DroppedFile droppedFile});

  Future<LivenessDetectionResultModel> livenessDetection(
      {required XFile xFile});
}
