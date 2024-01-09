import 'package:flutter_ocr_verifik/utils/export_files.dart';

final locator = GetIt.instance;

Future<void> injectDependencies() async {
  locator.registerSingleton<ImagePickerUtil>(ImagePickerUtil());
}
