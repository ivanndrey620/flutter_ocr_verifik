part of 'liveness_check_bloc.dart';

abstract class LivenessCheckEvent {}

class OnLivenessCheckEvent extends LivenessCheckEvent {
  final XFile xFile;

  OnLivenessCheckEvent({required this.xFile});
}
