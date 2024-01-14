import 'package:flutter_ocr_verifik/utils/export_files.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  Dio dio;

  RemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<OcrScanningModel> getTextFromImage(
      {required DroppedFile droppedFile}) async {
    try {
      String base64Image = base64Encode(droppedFile.byteList);

      final response = await dio.post(
        '/ocr/scan-demo',
        data: {'image': base64Image},
      );

      final data = response.data['data'];

      return OcrScanningModel.fromJson(data);
    } catch (e) {
      throw ('Error is $e');
    }
  }

  @override
  Future<LivenessDetectionResultModel> livenessDetection(
      {required XFile xFile}) async {
    try {
      final bytes = await xFile.readAsBytes();

      FormData formData = FormData.fromMap({
        'photo': MultipartFile.fromBytes(
          bytes,
          filename: 'picture',
        ),
      });

      final response = await dio.post(
        '/photo/liveness',
        data: formData,
      );

      final status = response.data['status'];

      if (status == 'failure') {
        final errorMessage = response.data['message'];
        throw (errorMessage);
      }

      return LivenessDetectionResultModel.fromJson(response.data);
    } catch (e) {
      throw ('Error is $e');
    }
  }
}
