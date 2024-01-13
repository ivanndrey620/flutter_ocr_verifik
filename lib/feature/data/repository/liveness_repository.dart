import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class LivenesRepository {
  Future<LivenessDetectionResultModel> livenessDetection(
      {required XFile xFile});
}
