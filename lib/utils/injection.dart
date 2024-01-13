import 'package:flutter_ocr_verifik/feature/data/repository/liveness_repository_impl.dart';
import 'package:flutter_ocr_verifik/feature/data/repository/ocr_repository_impl.dart';
import 'package:flutter_ocr_verifik/feature/presentation/liveness_check/bloc/liveness_check_bloc.dart';
import 'package:flutter_ocr_verifik/utils/export_files.dart';

final locator = GetIt.instance;

Future<void> injectDependencies() async {
  locator.registerFactory<Dio>(() => DioClient.dioIstance, instanceName: 'ocr');

  locator.registerFactory<Dio>(() => DioClient.livenessDioInstance,
      instanceName: 'livenesss');

  locator.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl(
    dio: locator.get(instanceName: 'ocr'),
    livenessDio: locator.get(instanceName: 'livenesss'),
  ));

  locator.registerSingleton<OcrRepository>(
      OcrRepositoryImpl(remoteDataSource: locator.get()));

  locator.registerSingleton<LivenesRepository>(
      LivenesRepositoryImpl(remoteDataSource: locator.get()));

  locator.registerFactory<OcrProcessBloc>(
      () => OcrProcessBloc(ocrRepository: locator.get()));

  locator.registerFactory(() => IdScanningBloc());

  locator.registerFactory(
      () => LivenessCheckBloc(livenesRepository: locator.get()));

  locator.registerSingletonAsync<CameraDescription>(() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;

    return firstCamera;
  });
}
