import 'package:flutter_ocr_verifik/utils/export_files.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      title: StringConstants.appTitle,
      home: const HomeScreen(),
    );
  }
}
