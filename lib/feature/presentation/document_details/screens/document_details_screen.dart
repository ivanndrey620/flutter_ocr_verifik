import 'package:flutter_ocr_verifik/utils/export_files.dart';

class DocumentDetailsScreen extends StatelessWidget {
  const DocumentDetailsScreen({
    super.key,
    required this.droppedFile,
  });

  final DroppedFile droppedFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<OcrProcessBloc>()
        ..add(GetTextFromImageEvent(droppedFile: droppedFile)),
      child: BlocBuilder<OcrProcessBloc, OcrProcessState>(
        builder: (context, state) {
          return CustomRowWidget(
            rowOne: Column(
              children: [
                const SizedBox(height: 20),
                const CustomTitle(title: StringConstants.documentScanned),
                const SizedBox(height: 20),
                Image.network(
                  droppedFile.url,
                  width: 300,
                  height: 300,
                ),
              ],
            ),
            rowTwo: state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (result) {
                context
                    .read<AppBloc>()
                    .add(OnLoadScannedTextResultEvent(scannedText: result));
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScanPromptResult(result: result),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                                backgroundColor: Colors.white,
                                content: StringConstants.scanAgain,
                                onPressed: () => context
                                    .read<AppBloc>()
                                    .add(OnRestartEvent())),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: CustomButton(
                                content: 'Continue',
                                onPressed: () => context
                                    .read<AppBloc>()
                                    .add(OnAppLivenessCheckEvent())),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
              error: (error) => Text('Error $error'),
            ),
          );
        },
      ),
    );
  }
}
