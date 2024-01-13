import 'package:flutter_ocr_verifik/feature/presentation/widgets/general_information_widget.dart';
import 'package:flutter_ocr_verifik/feature/presentation/widgets/liveness_and_match_results_widget.dart';
import 'package:flutter_ocr_verifik/utils/export_files.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.xFile,
    required this.droppedFile,
    required this.scannedText,
    required this.webBrowserInfo,
  });

  final XFile xFile;
  final DroppedFile droppedFile;
  final ScannedText scannedText;
  final WebBrowserInfo webBrowserInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<LivenessCheckBloc>()
        ..add(OnLivenessCheckEvent(xFile: xFile)),
      child: CustomRowWidget(
        rowOne: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomTitle(title: 'Selfie'),
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
                    loaded: (livenessDetectionResult) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralInformationWidget(
                            webBrowserInfo: webBrowserInfo),
                        const SizedBox(height: 10),
                        LivenessScoreChart(
                          title: 'Liveness score',
                          score: livenessDetectionResult.scoreFixed,
                          roundedScore: livenessDetectionResult.roundedScore,
                        ),
                        LivenessAndMatchResultsWidget(
                            livenessDetectionResult: livenessDetectionResult)
                      ],
                    ),
                    error: (error) => Text('Error is $error'),
                  ),
                  ScanPromptResult(result: scannedText),
                  const SizedBox(height: 10),
                  Center(
                    child: CustomButton(
                      content: 'Restart demo',
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
