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
    } on DioException catch (e) {
      throw ('Error is $e');
    }
  }

  @override
  Future<FaceRecognitionLivenessModel> livenessDetection(
      {required XFile xFile}) async {
    try {
      final byteList = await xFile.readAsBytes();

      String base64Image = base64Encode(byteList);

      final response = await dio.post(
        '/face-recognition/liveness/demo',
        data: {
          'os': 'DESKTOP',
          'image': base64Image,
        },
      );

      final result = response.data['data']['result'];

      return FaceRecognitionLivenessModel.fromJson(result);
    } on DioException catch (e) {
      throw ('Error with face recognition - $e');
    }
  }

  @override
  Future<CompareFacesResult> compareFaces({
    required XFile xFile,
    required DroppedFile droppedFile,
  }) async {
    try {
      final byteList = await xFile.readAsBytes();

      String galleryImage = base64Encode(byteList);
      String probeImage = base64Encode(droppedFile.byteList);

      final map = {
        'search_mode': 'ACCURATE',
        'gallery': [galleryImage],
        'probe': [probeImage],
      };

      final response = await dio.post(
        '/face-recognition/compare/demo',
        data: map,
      );

      final data = response.data['data']['result'];

      return CompareFacesResult.fromJson(data);
    } on DioException catch (e) {
      throw ('Error compare faces - ${e.message}');
    }
  }
}
