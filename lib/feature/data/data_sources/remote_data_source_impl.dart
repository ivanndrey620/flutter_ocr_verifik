import 'package:flutter_ocr_verifik/utils/export_files.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  Dio dio;

  RemoteDataSourceImpl({required this.dio});

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
}
