import 'package:flutter_ocr_verifik/utils/export_files.dart';

class LivenessAndMatchResultsWidget extends StatelessWidget {
  const LivenessAndMatchResultsWidget({
    super.key,
    required this.livenessDetectionResult,
  });

  final LivenessDetectionResultModel livenessDetectionResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: 'Liveness & Match results'),
        const SizedBox(height: 20),
        CustomTitleAndContentWidget(
          title: 'Liveness score',
          content: livenessDetectionResult.scoreFixed,
        ),
        CustomTitleAndContentWidget(
          title: 'Liveness passed',
          content: '${livenessDetectionResult.resultIs}',
        ),
      ],
    );
  }
}
