import 'package:flutter_ocr_verifik/utils/export_files.dart';

class DocumentScanned extends StatelessWidget {
  const DocumentScanned({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const CustomTitle(title: StringConstants.documentScanned),
        const SizedBox(height: 20),
        Image.network(
          url,
          width: 300,
          height: 300,
        ),
      ],
    );
  }
}
