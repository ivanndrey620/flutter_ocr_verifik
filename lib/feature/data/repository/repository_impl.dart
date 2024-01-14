import 'package:flutter_ocr_verifik/utils/export_files.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<OcrScanningModel> getTextFromImage(
      {required DroppedFile droppedFile}) {
    return remoteDataSource.getTextFromImage(droppedFile: droppedFile);
  }

  @override
  Future<FaceRecognitionLivenessModel> livenessDetection(
      {required XFile xFile}) {
    return remoteDataSource.livenessDetection(xFile: xFile);
  }

  @override
  Future<CompareFacesResult> compareFaces({
    required XFile xFile,
    required DroppedFile droppedFile,
  }) {
    return remoteDataSource.compareFaces(
      xFile: xFile,
      droppedFile: droppedFile,
    );
  }
}
