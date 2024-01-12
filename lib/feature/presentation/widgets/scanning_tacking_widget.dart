import 'package:flutter_ocr_verifik/utils/export_files.dart';

class ScanningTrackingWidget extends StatelessWidget {
  const ScanningTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int id = 1;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.2),
        ),
      ),
      width: double.infinity,
      height: kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomStep(
                content: 'ID Scanning',
                id: id++,
              ),
            ),
            Expanded(
              child: CustomStep(
                content: 'Document Details',
                id: id++,
              ),
            ),
            Expanded(
              child: CustomStep(
                content: 'Liveness check',
                id: id++,
              ),
            ),
            Expanded(
              child: CustomStep(
                content: 'Results',
                id: id++,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomStep extends StatelessWidget {
  const CustomStep({
    super.key,
    required this.content,
    required this.id,
  });

  final String content;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue,
          child: Text(
            '$id',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(content),
        ),
      ],
    );
  }
}
