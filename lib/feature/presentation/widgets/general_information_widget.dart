import 'package:flutter_ocr_verifik/utils/export_files.dart';

class GeneralInformationWidget extends StatelessWidget {
  const GeneralInformationWidget({super.key, required this.webBrowserInfo});

  final WebBrowserInfo webBrowserInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: 'General Information'),
        const SizedBox(height: 20),
        CustomTitleAndContentWidget(
          title: 'Device',
          content: webBrowserInfo.browserName.name,
        ),
        CustomTitleAndContentWidget(
          title: 'Language',
          content: webBrowserInfo.language ?? '',
        ),
        CustomTitleAndContentWidget(
          title: 'User Agent',
          content: webBrowserInfo.userAgent ?? '',
        ),
      ],
    );
  }
}
