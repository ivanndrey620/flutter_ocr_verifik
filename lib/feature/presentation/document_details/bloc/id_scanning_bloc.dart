import 'package:flutter_ocr_verifik/utils/export_files.dart';

part 'id_scanning_event.dart';
part 'id_scanning_state.dart';
part 'id_scanning_bloc.freezed.dart';

class IdScanningBloc extends Bloc<IdScanningEvent, IdScanningState> {
  IdScanningBloc() : super(const IdScanningState.noScanned()) {
    on<DroppedFileEvent>((event, emit) =>
        emit(IdScanningState.scanned(droppedFile: event.droppedFile)));

    on<ReStartScanEvent>(
        (event, emit) => emit(const IdScanningState.noScanned()));
  }
}
