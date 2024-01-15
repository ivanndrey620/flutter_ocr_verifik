import 'package:flutter_ocr_verifik/utils/export_files.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.xFile,
    required this.droppedFile,
    required this.webBrowserInfo,
    required this.ocrScanningResult,
  });

  final XFile xFile;
  final DroppedFile droppedFile;
  final WebBrowserInfo webBrowserInfo;
  final OcrScanningModel ocrScanningResult;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<LivenessCheckBloc>()
        ..add(OnLivenessCheckEvent(
          xFile: xFile,
          droppedFile: droppedFile,
        )),
      child: CustomRowWidget(
        rowOne: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomTitle(title: StringConstants.selfie),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 300,
                child: Image.network(xFile.path),
              ),
              const CustomTitle(title: StringConstants.documentScanned),
              const SizedBox(height: 10),
              Image.network(
                droppedFile.url,
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
        rowTwo: BlocBuilder<LivenessCheckBloc, LivenessCheckState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (
                      faceRecognitionResult,
                      compareFacesResult,
                    ) =>
                        Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralInformationWidget(
                            webBrowserInfo: webBrowserInfo),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LivenessScoreChart(
                              title: StringConstants.livenessScore,
                              score: faceRecognitionResult
                                  .livenessScoreWithPercentage,
                              roundedScore: faceRecognitionResult.roundedScore,
                            ),
                            LivenessScoreChart(
                              title: StringConstants.matchScore,
                              score: compareFacesResult.scoreWithPercentage,
                              roundedScore: compareFacesResult.roundedScore,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        LivenessAndMatchResultsWidget(
                          faceRecognitionLivenessModel: faceRecognitionResult,
                          compareFacesResult: compareFacesResult,
                        ),
                        CustomOcrPrompt(
                          ocrPrompt: ocrScanningResult.ocrPrompt,
                          ocrDocumentType: ocrScanningResult.documentType,
                        ),
                        const SizedBox(height: 20),
                        CustomOcrPro(
                          ocrPro: ocrScanningResult.ocrPro,
                          ocrDocumentType: ocrScanningResult.documentType,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    error: (error) => Text('Error is $error'),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: CustomButton(
                      content: StringConstants.reStartDemo,
                      onPressed: () =>
                          context.read<AppBloc>().add(OnRestartEvent()),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
