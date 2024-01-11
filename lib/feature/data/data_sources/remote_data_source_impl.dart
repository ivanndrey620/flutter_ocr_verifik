import 'package:flutter_ocr_verifik/utils/export_files.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<OcrResultModel> getTextFromImage({required XFile xFile}) async {
    try {
      final bytes = await xFile.readAsBytes();

      FormData formData = FormData.fromMap({
        'language': 'spa',
        'isOverlayRequired': false,
        'iscreatesearchablepdf': false,
        'issearchablepdfhidetextlayer': false,
        'filetype': 'png',
        'OCREngine': 2,
        'scale': true,
        'file': MultipartFile.fromBytes(
          bytes,
          filename: xFile.name,
        ),
      });

      final response = await dio.post(
        '/parse/image',
        data: formData,
      );

      print('response data ${response.data}');

      return OcrResultModel.fromJson(response.data);
    } catch (e) {
      throw ('Error is $e');
    }
  }
}
