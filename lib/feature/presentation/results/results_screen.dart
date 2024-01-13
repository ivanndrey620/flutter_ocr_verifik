import 'package:flutter_ocr_verifik/utils/export_files.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.xFile});

  final XFile xFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<LivenessCheckBloc>()
        ..add(OnLivenessCheckEvent(xFile: xFile)),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<LivenessCheckBloc, LivenessCheckState>(
          builder: (context, state) {
            return Column(
              children: [
                const ScanningTrackingWidget(),
                CustomRowWidget(
                  rowOne: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const CustomTitle(title: 'Selfie'),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.network(xFile.path),
                        ),
                      ],
                    ),
                  ),
                  rowTwo: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const CustomTitle(title: 'General Information'),
                        const SizedBox(height: 20),
                        state.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => const CircularProgressIndicator(),
                          loaded: (livenessDetectionResult) => Column(
                            children: [
                              LivenessScoreChart(
                                title: 'Liveness score',
                                score: livenessDetectionResult.scoreFixed,
                                roundedScore:
                                    livenessDetectionResult.roundedScore,
                              ),
                            ],
                          ),
                          error: (error) => Text('Error is $error'),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
