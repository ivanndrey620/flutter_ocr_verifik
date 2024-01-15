part of 'app_bloc.dart';

abstract class AppEvent {}

class OnDocumentScannedEvent extends AppEvent {
  final DroppedFile droppedFile;

  OnDocumentScannedEvent({required this.droppedFile});
}

class OnAppLivenessCheckEvent extends AppEvent {
  OnAppLivenessCheckEvent();
}

class OnShowResultsEvent extends AppEvent {
  final DroppedFile droppedFile;
  final XFile xFile;

  OnShowResultsEvent({
    required this.droppedFile,
    required this.xFile,
  });
}

class OnRestartEvent extends AppEvent {}

class OnLoadScannedTextResultEvent extends AppEvent {
  final OcrScanningModel ocrScanningModel;

  OnLoadScannedTextResultEvent({required this.ocrScanningModel});
}
