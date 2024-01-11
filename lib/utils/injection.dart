import 'package:flutter_ocr_verifik/utils/export_files.dart';

final locator = GetIt.instance;

Future<void> injectDependencies() async {
  locator.registerFactory<Dio>(() => DioClient.dioIstance);

  locator.registerSingleton<RemoteDataSource>(
      RemoteDataSourceImpl(dio: locator.get()));

  locator.registerSingleton<Repository>(
      RepositoryImpl(remoteDataSource: locator.get()));

  locator.registerSingleton<ImagePickerUtil>(ImagePickerUtil());

  locator.registerFactory<OcrProcessBloc>(() => OcrProcessBloc(
        repository: locator.get(),
        imagePickerUtil: locator.get(),
      ));
}
