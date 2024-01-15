part of 'liveness_check_bloc.dart';

abstract class LivenessCheckEvent {}

class OnLivenessCheckEvent extends LivenessCheckEvent {
  final XFile xFile;
  final DroppedFile droppedFile;

  OnLivenessCheckEvent({
    required this.xFile,
    required this.droppedFile,
  });
}
