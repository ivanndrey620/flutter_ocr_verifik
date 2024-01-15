import 'package:flutter_ocr_verifik/utils/export_files.dart';

enum KycEnum {
  idScanning,
  documentDetails,
  livenessCheck,
  results,
}

class KycProcessState {
  final AppState appState;
  final KycEnum kycEnum;

  const KycProcessState({
    AppState? appState,
    this.kycEnum = KycEnum.idScanning,
  }) : appState = appState ?? const AppState.idScanning();

  KycProcessState copyWith({AppState? appState, KycEnum? kycEnum}) =>
      KycProcessState(
        appState: appState ?? this.appState,
        kycEnum: kycEnum ?? this.kycEnum,
      );
}
