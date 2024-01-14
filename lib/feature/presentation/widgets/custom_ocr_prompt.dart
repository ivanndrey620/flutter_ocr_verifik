import 'package:flutter_ocr_verifik/utils/export_files.dart';

class CustomOcrPrompt extends StatelessWidget {
  const CustomOcrPrompt({
    super.key,
    required this.ocrPrompt,
    required this.ocrDocumentType,
  });

  final OcrPrompt? ocrPrompt;
  final OcrDocumentType ocrDocumentType;

  @override
  Widget build(BuildContext context) {
    final prompt = ocrPrompt;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: 'Scan Prompt - Document extraction'),
        const SizedBox(height: 20),
        CustomTitleAndContentWidget(
          title: 'DocumentType',
          content: ocrDocumentType.documentType,
        ),
        prompt == null
            ? const SizedBox.shrink()
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: prompt.ocrExtraction.length,
                itemBuilder: (context, index) {
                  final key = prompt.ocrExtraction.keys.elementAt(index);

                  final content = prompt.ocrExtraction.values.toList()[index];

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
