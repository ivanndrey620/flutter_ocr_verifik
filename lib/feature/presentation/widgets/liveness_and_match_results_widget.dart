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
        const CustomTitle(title: StringConstants.livenessAndMatch),
        const SizedBox(height: 20),
        CustomTitleAndContentWidget(
          title: StringConstants.livenessScore,
          content: faceRecognitionLivenessModel.livenessScoreWithPercentage,
        ),
        CustomTitleAndContentWidget(
          title: StringConstants.livenessPassed,
          content: '${faceRecognitionLivenessModel.passed}',
        ),
        CustomTitleAndContentWidget(
          title: StringConstants.minimumLivenessScore,
          content: '${faceRecognitionLivenessModel.roundedMinScore}',
        ),
        CustomTitleAndContentWidget(
          title: StringConstants.matchScore,
          content: '${compareFacesResult.roundedScore}',
        ),
        //
      ],
    );
  }
}
