import 'package:flutter_ocr_verifik/utils/export_files.dart';

class CustomOcrPro extends StatelessWidget {
  const CustomOcrPro({
    super.key,
    required this.ocrPro,
    required this.ocrDocumentType,
  });

  final OcrPro? ocrPro;
  final OcrDocumentType ocrDocumentType;

  @override
  Widget build(BuildContext context) {
    ocrPro?.ocrExtraction.removeWhere((key, value) => key == 'details');

    final pro = ocrPro;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: 'Scan Zero - Document extraction'),
        const SizedBox(height: 20),
        CustomTitleAndContentWidget(
          title: 'DocumentType',
          content: ocrDocumentType.documentType,
        ),
        pro == null
            ? const SizedBox.shrink()
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pro.ocrExtraction.length,
                itemBuilder: (context, index) {
                  final key = pro.ocrExtraction.keys.elementAt(index);

                  final content = pro.ocrExtraction.values.toList()[index];

                  return CustomTitleAndContentWidget(
                    title: key.sentenceCase,
                    content: '$content',
                  );
                },
              ),
      ],
    );
  }
}
