import 'package:flutter_ocr_verifik/utils/export_files.dart';

class ScanningTrackingWidget extends StatelessWidget {
  const ScanningTrackingWidget({super.key, required this.kycEnum});

  final KycEnum kycEnum;

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
                color: kycEnum == KycEnum.idScanning
                    ? Colors.indigo
                    : Colors.indigo[100]!,
              ),
            ),
            Expanded(
              child: CustomStep(
                content: 'Document Details',
                id: id++,
                color: kycEnum == KycEnum.documentDetails
                    ? Colors.indigo
                    : Colors.indigo[100]!,
              ),
            ),
            Expanded(
              child: CustomStep(
                content: 'Liveness check',
                id: id++,
                color: kycEnum == KycEnum.livenessCheck
                    ? Colors.indigo
                    : Colors.indigo[100]!,
              ),
            ),
            Expanded(
              child: CustomStep(
                content: 'Results',
                id: id++,
                color: kycEnum == KycEnum.results
                    ? Colors.indigo
                    : Colors.indigo[100]!,
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
    required this.color,
  });

  final String content;
  final int id;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: color,
          child: Text(
            '$id',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
