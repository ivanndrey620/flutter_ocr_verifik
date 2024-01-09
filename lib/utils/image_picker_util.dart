import 'package:flutter_ocr_verifik/utils/export_files.dart';

class ImagePickerUtil {
  ImagePickerUtil() {
    print('entro aquial constructor');
    _picker = ImagePicker();
  }

  static late ImagePicker _picker;

  Future<XFile?> displayPickImage({
    double? maxWidth,
    double? maxHeight,
    int? quality,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: quality,
      );

      return pickedFile;
    } catch (e) {
      rethrow;
    }
  }
}
