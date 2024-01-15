import 'package:flutter_ocr_verifik/utils/export_files.dart';

class CustomTitleAndContentWidget extends StatelessWidget {
  const CustomTitleAndContentWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Text(content),
        ),
        const Divider(
          height: 2.0,
        ),
      ],
    );
  }
}
