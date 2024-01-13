import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, KycProcessState> {
  late DroppedFile droppedFile;
  late ScannedText scannedText;

  final DeviceInfoPlugin deviceInfoPlugin;

  AppBloc({required this.deviceInfoPlugin}) : super(const KycProcessState()) {
    on<OnDocumentScannedEvent>((event, emit) {
      droppedFile = event.droppedFile;

      emit(state.copyWith(
        kycEnum: KycEnum.documentDetails,
        appState: AppState.documentDetails(droppedFile: droppedFile),
      ));
    });

    on<OnLoadScannedTextResultEvent>(
        (event, emit) => scannedText = event.scannedText);

    on<OnRestartEvent>((event, emit) {
      emit(state.copyWith(
        kycEnum: KycEnum.idScanning,
        appState: const AppState.idScanning(),
      ));
    });

    on<OnAppLivenessCheckEvent>((event, emit) {
      emit(state.copyWith(
        kycEnum: KycEnum.livenessCheck,
        appState: AppState.livenessCheck(droppedFile: droppedFile),
      ));
    });

    on<OnShowResultsEvent>((event, emit) async {
      final webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;

      emit(state.copyWith(
        kycEnum: KycEnum.results,
        appState: AppState.results(
          droppedFile: droppedFile,
          xFile: event.xFile,
          scannedText: scannedText,
          webBrowserInfo: webBrowserInfo,
        ),
      ));
    });
  }
}
