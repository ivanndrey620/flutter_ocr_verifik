import 'package:flutter_ocr_verifik/utils/export_files.dart';

class KycProcessScreen extends StatelessWidget {
  const KycProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<AppBloc>(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AppBloc, KycProcessState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: (constraints.maxHeight - kToolbarHeight),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScanningTrackingWidget(kycEnum: state.kycEnum),
                      SizedBox(
                        height: constraints.maxHeight,
                        child: state.appState.when(
                          idScanning: () => const IdScanningScreen(),
                          documentDetails: (droppedFile) =>
                              DocumentDetailsScreen(droppedFile: droppedFile),
                          livenessCheck: (droppedFile) =>
                              LivenessCheckScreen(droppedFile: droppedFile),
                          results: (
                            droppedFile,
                            xFile,
                            webBrowserInfo,
                          ) =>
                              ResultsScreen(
                            xFile: xFile,
                            droppedFile: droppedFile,
                            webBrowserInfo: webBrowserInfo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
