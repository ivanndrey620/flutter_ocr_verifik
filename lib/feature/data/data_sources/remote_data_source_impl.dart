import 'package:flutter_ocr_verifik/utils/export_files.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  Dio dio;
  Dio livenessDio;

  RemoteDataSourceImpl({
    required this.dio,
    required this.livenessDio,
  });

  @override
  Future<OcrResultModel> getTextFromImage(
      {required DroppedFile droppedFile}) async {
    try {
      final fileType = droppedFile.name.split('.').last;

      FormData formData = FormData.fromMap({
        'language': 'spa',
        'isOverlayRequired': false,
        'iscreatesearchablepdf': false,
        'issearchablepdfhidetextlayer': false,
        'filetype': fileType,
        'OCREngine': 2,
        'scale': true,
        'file': MultipartFile.fromBytes(
          droppedFile.byteList,
          filename: droppedFile.name,
        ),
      });

      final response = await dio.post(
        '/parse/image',
        data: formData,
      );

      return OcrResultModel.fromJson(response.data);
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

      final response = await livenessDio.post(
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
