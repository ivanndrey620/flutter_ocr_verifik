import 'package:flutter_ocr_verifik/utils/export_files.dart';

class ScanPromptResult extends StatelessWidget {
  const ScanPromptResult({
    super.key,
    required this.result,
  });

  final ScannedText result;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const CustomTitle(title: StringConstants.scanPrompt),
          const SizedBox(height: 20),
          CustomTitleAndContentWidget(
            title: StringConstants.documentNumber,
            content: result.cui,
          ),
          CustomTitleAndContentWidget(
            title: StringConstants.firstName,
            content: result.name,
          ),
          CustomTitleAndContentWidget(
            title: StringConstants.lastname,
            content: result.lastname,
          ),
          CustomTitleAndContentWidget(
            title: StringConstants.fullName,
            content: result.completeName,
          ),
          CustomTitleAndContentWidget(
            title: StringConstants.dateOfBirth,
            content: result.dateOfBirth,
          ),
          CustomTitleAndContentWidget(
            title: StringConstants.country,
            content: result.countryOfBirth,
          ),
          CustomTitleAndContentWidget(
            title: StringConstants.nacionality,
            content: result.nacionality,
          ),
          CustomTitleAndContentWidget(
            title: StringConstants.gender,
            content: result.sex,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
