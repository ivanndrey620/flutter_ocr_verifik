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
      child: BlocListener<OcrProcessBloc, OcrProcessState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (ocrScanningModel, webBrowserInfo) => context
                .read<AppBloc>()
                .add(OnLoadScannedTextResultEvent(
                    ocrScanningModel: ocrScanningModel)),
          );
        },
        child: BlocBuilder<OcrProcessBloc, OcrProcessState>(
          builder: (context, state) {
            return CustomRowWidget(
              rowOne: DocumentScanned(url: droppedFile.url),
              rowTwo: state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (
                  result,
                  webBrowserInfo,
                ) {
                  final ocrPrompt = result.ocrPrompt;
                  final ocrPro = result.ocrPro;
                  final ocrDocumentType = result.documentType;

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralInformationWidget(
                            webBrowserInfo: webBrowserInfo),
                        CustomOcrPrompt(
                          ocrPrompt: ocrPrompt,
                          ocrDocumentType: ocrDocumentType,
                        ),
                        const SizedBox(height: 20),
                        CustomOcrPro(
                          ocrPro: ocrPro,
                          ocrDocumentType: ocrDocumentType,
                        ),
                        const SizedBox(height: 20),
                        const _Buttons(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
                error: (error) => Column(
                  children: [
                    Text('Error $error'),
                    const SizedBox(height: 20),
                    CustomButton(
                      backgroundColor: Colors.white,
                      content: StringConstants.scanAgain,
                      onPressed: () =>
                          context.read<AppBloc>().add(OnRestartEvent()),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            backgroundColor: Colors.white,
            content: StringConstants.scanAgain,
            onPressed: () => context.read<AppBloc>().add(OnRestartEvent()),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: CustomButton(
            content: StringConstants.goNext,
            onPressed: () =>
                context.read<AppBloc>().add(OnAppLivenessCheckEvent()),
          ),
        )
      ],
    );
  }
}
