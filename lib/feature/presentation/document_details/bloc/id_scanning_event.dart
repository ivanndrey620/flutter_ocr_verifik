part of 'id_scanning_bloc.dart';

abstract class IdScanningEvent {}

class DroppedFileEvent extends IdScanningEvent {
  final DroppedFile droppedFile;

  DroppedFileEvent({required this.droppedFile});
}

class ReStartScanEvent extends IdScanningEvent {}
