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
  Future<void> livenessDetection({required XFile xFile}) async {
    try {
      final byteList = await xFile.readAsBytes();

      String base64Image = base64Encode(byteList);

      final response = await dio.post(
        '/ocr/scan-demo',
        data: {
          'image': base64Image,
          'os': 'DESKTOP',
        },
      );

      final data = response.data['data'];

      print('data is $data');
    } catch (e) {
      throw ('Error is $e');
    }
  }
}
