part of 'id_scanning_bloc.dart';

@freezed
class IdScanningState with _$IdScanningState {
  const factory IdScanningState.noScanned() = _NoScanned;

  const factory IdScanningState.scanned({required DroppedFile droppedFile}) =
      _Scanned;
}
