import 'package:flutter_ocr_verifik/utils/export_files.dart';

class DocumentDetailsScreen extends StatelessWidget {
  const DocumentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<IdScanningBloc>(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const ScanningTrackingWidget(),
            BlocBuilder<IdScanningBloc, IdScanningState>(
              builder: (context, state) => state.when(
                noScanned: () => const _NoScannedId(),
                scanned: (droppedFile) => _ScannedId(droppedFile: droppedFile),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannedId extends StatelessWidget {
  const _ScannedId({required this.droppedFile});

  final DroppedFile droppedFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<OcrProcessBloc>()
        ..add(GetTextFromImageEvent(droppedFile: droppedFile)),
      child: BlocBuilder<OcrProcessBloc, OcrProcessState>(
        builder: (context, state) {
          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const CustomTitle(
                            title: StringConstants.documentScanned),
                        const SizedBox(height: 20),
                        Image.network(
                          droppedFile.url,
                          width: 300,
                          height: 300,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loaded: (result) => SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const CustomTitle(
                                  title: StringConstants.scanPrompt),
                              const SizedBox(height: 20),
                              DocumentExtractionWidget(
                                title: StringConstants.documentNumber,
                                content: result.cui,
                              ),
                              DocumentExtractionWidget(
                                title: StringConstants.firstName,
                                content: result.name,
                              ),
                              DocumentExtractionWidget(
                                title: StringConstants.lastname,
                                content: result.lastname,
                              ),
                              DocumentExtractionWidget(
                                title: StringConstants.fullName,
                                content: result.completeName,
                              ),
                              DocumentExtractionWidget(
                                title: StringConstants.dateOfBirth,
                                content: result.dateOfBirth,
                              ),
                              DocumentExtractionWidget(
                                title: StringConstants.country,
                                content: result.countryOfBirth,
                              ),
                              DocumentExtractionWidget(
                                title: StringConstants.nacionality,
                                content: result.nacionality,
                              ),
                              DocumentExtractionWidget(
                                title: StringConstants.gender,
                                content: result.sex,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                        backgroundColor: Colors.white,
                                        content: StringConstants.scanAgain,
                                        onPressed: () => context
                                            .read<IdScanningBloc>()
                                            .add(ReStartScanEvent())),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: CustomButton(
                                        content: 'Continue', onPressed: () {}),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      error: (error) => Text('Error $error'),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NoScannedId extends StatelessWidget {
  const _NoScannedId();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[50],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomTitle(title: StringConstants.uploadYourId),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(AssetsConstants.noImage),
                  const SizedBox(height: 30),
                  CustomButton(
                    content: StringConstants.uploadFile,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (ctx) => BlocProvider<IdScanningBloc>.value(
                        value: BlocProvider.of<IdScanningBloc>(context),
                        child: CustomDialog(
                          children: [
                            DropzoneWidget(onDroppedFile: (file) {
                              Navigator.pop(context);
                              context
                                  .read<IdScanningBloc>()
                                  .add(DroppedFileEvent(droppedFile: file));
                            }),
                            CustomButton(
                              backgroundColor: Colors.white,
                              content: StringConstants.cancel,
                              onPressed: () => Navigator.pop(context),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomTitle(title: StringConstants.scanYourId),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(AssetsConstants.noImage),
                  const SizedBox(height: 30),
                  CustomButton(
                    content: StringConstants.startScanning,
                    onPressed: () => context.go('/livenessCheck'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
