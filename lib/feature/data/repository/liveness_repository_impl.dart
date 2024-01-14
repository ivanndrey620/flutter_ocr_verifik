import 'package:flutter_ocr_verifik/utils/export_files.dart';

class LivenesRepositoryImpl extends LivenesRepository {
  final RemoteDataSource remoteDataSource;

  LivenesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> livenessDetection({required XFile xFile}) {
    return remoteDataSource.livenessDetection(xFile: xFile);
  }
}
