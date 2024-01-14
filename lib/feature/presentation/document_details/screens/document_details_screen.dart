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
                final ocrPromptList = result.ocrPrompt;
                final ocrProList = result.ocrPro;

                ocrProList?.ocrExtraction
                    .removeWhere((key, value) => key == 'details');

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GeneralInformationWidget(webBrowserInfo: webBrowserInfo),
                      const CustomTitle(
                          title: 'Scan Prompt - Document extraction'),
                      ocrPromptList == null
                          ? const SizedBox.shrink()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: ocrPromptList.ocrExtraction.length,
                              itemBuilder: (context, index) {
                                final key = ocrPromptList.ocrExtraction.keys
                                    .elementAt(index);

                                final content = ocrPromptList
                                    .ocrExtraction.values
                                    .toList()[index];

                                return Column(
                                  children: <Widget>[
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15.0),
                                        child: Text(
                                          key.sentenceCase,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      subtitle: Text('$content'),
                                    ),
                                    const Divider(
                                      height: 2.0,
                                    ),
                                  ],
                                );
                              },
                            ),
                      const SizedBox(height: 20),
                      const CustomTitle(
                          title: 'Scan Zero - Document extraction'),
                      ocrProList == null
                          ? const SizedBox.shrink()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: ocrProList.ocrExtraction.length,
                              itemBuilder: (context, index) {
                                final key = ocrProList.ocrExtraction.keys
                                    .elementAt(index);

                                final content = ocrProList.ocrExtraction.values
                                    .toList()[index];

                                return Column(
                                  children: <Widget>[
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15.0),
                                        child: Text(
                                          key.sentenceCase,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      subtitle: Text('$content'),
                                    ),
                                    const Divider(
                                      height: 2.0,
                                    ),
                                  ],
                                );
                              },
                            ),
                      const SizedBox(height: 20),
                      const _Buttons(),
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
            content: 'Continue',
            onPressed: () =>
                context.read<AppBloc>().add(OnAppLivenessCheckEvent()),
          ),
        )
      ],
    );
  }
}
