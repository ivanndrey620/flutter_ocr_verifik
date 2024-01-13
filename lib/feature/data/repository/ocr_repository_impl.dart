import 'package:flutter_ocr_verifik/utils/export_files.dart';

class OcrRepositoryImpl extends OcrRepository {
  final RemoteDataSource remoteDataSource;

  OcrRepositoryImpl({required this.remoteDataSource});

  @override
  Future<OcrResultModel> getTextFromImage({required DroppedFile droppedFile}) {
    return remoteDataSource.getTextFromImage(droppedFile: droppedFile);
  }
}
