import 'package:flutter_ocr_verifik/utils/export_files.dart';

abstract class LivenesRepository {
  Future<void> livenessDetection({required XFile xFile});
}
