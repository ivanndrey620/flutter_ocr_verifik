import 'package:flutter_ocr_verifik/utils/export_files.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<OcrResultModel> getTextFromImage({required XFile xFile}) {
    return remoteDataSource.getTextFromImage(xFile: xFile);
  }
}
