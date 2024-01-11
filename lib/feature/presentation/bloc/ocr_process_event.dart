part of 'ocr_process_bloc.dart';

abstract class OcrProcessEvent {}

class GetTextFromImageEvent extends OcrProcessEvent {
  GetTextFromImageEvent();
}
