part of 'ocr_process_bloc.dart';

abstract class OcrProcessEvent {}

class GetTextFromImageEvent extends OcrProcessEvent {
  final DroppedFile droppedFile;

  GetTextFromImageEvent({required this.droppedFile});
}
