import 'package:flutter_ocr_verifik/utils/export_files.dart';

final locator = GetIt.instance;

Future<void> injectDependencies() async {
  locator.registerFactory<DeviceInfoPlugin>(() => DeviceInfoPlugin());

  locator.registerFactory<Dio>(() => DioClient.dioIstance);

  locator.registerSingleton<RemoteDataSource>(RemoteDataSourceImpl(
    dio: locator.get(),
  ));

  locator.registerSingleton<Repository>(
      RepositoryImpl(remoteDataSource: locator.get()));

  locator.registerFactory<OcrProcessBloc>(() => OcrProcessBloc(
        repository: locator.get(),
        deviceInfoPlugin: locator.get(),
      ));

  locator.registerFactory(() => AppBloc(deviceInfoPlugin: locator.get()));

  locator.registerFactory(() => IdScanningBloc());

  locator.registerFactory(() => LivenessCheckBloc(repository: locator.get()));

  locator.registerSingletonAsync<CameraDescription>(() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;

    return firstCamera;
  });
}
