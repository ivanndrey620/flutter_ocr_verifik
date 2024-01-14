import 'package:flutter_ocr_verifik/utils/export_files.dart';

class LivenessAndMatchResultsWidget extends StatelessWidget {
  const LivenessAndMatchResultsWidget({
    super.key,
    required this.faceRecognitionLivenessModel,
    required this.compareFacesResult,
  });

  final FaceRecognitionLivenessModel faceRecognitionLivenessModel;
  final CompareFacesResult compareFacesResult;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: 'Liveness & Match results'),
        const SizedBox(height: 20),
        CustomTitleAndContentWidget(
          title: 'Liveness score',
          content: faceRecognitionLivenessModel.livenessScoreWithPercentage,
        ),
        CustomTitleAndContentWidget(
          title: 'Liveness passed',
          content: '${faceRecognitionLivenessModel.passed}',
        ),
        CustomTitleAndContentWidget(
          title: 'Minimum liveness score',
          content: '${faceRecognitionLivenessModel.roundedMinScore}',
        ),
        CustomTitleAndContentWidget(
          title: 'Match score',
          content: '${compareFacesResult.roundedScore}',
        ),
        //
      ],
    );
  }
}
