import 'package:flutter_ocr_verifik/utils/export_files.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final file =
                await locator.get<ImagePickerUtil>().displayPickImage();
          },
          child: const Text(
            'Seleccionar imagen',
          ),
        ),
      ),
    );
  }
}
