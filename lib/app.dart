import 'package:flutter_ocr_verifik/utils/export_files.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: StringConstants.appTitle,
      home: HomeScreen(),
    );
  }
}
