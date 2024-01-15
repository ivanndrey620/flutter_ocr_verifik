import 'package:flutter_ocr_verifik/utils/export_files.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  injectDependencies();

  await locator.allReady();

  runApp(const MyApp());
}
