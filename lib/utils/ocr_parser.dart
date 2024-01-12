import 'package:flutter_ocr_verifik/feature/domain/scanned_text_model.dart';
import 'package:flutter_ocr_verifik/utils/export_files.dart';

class OcrPaser {
  const OcrPaser();

  static ScannedText parseResult(OcrResultModel result) {
    final lines = result.parsedResults.first.textOverlay.lines;

    String name = '';
    String lastname = '';
    String cui = '';
    String nacionality = '';
    String dateOfBirth = '';
    String countryOfBirth = '';
    String sex = '';

    final cuiIndex =
        lines.indexWhere((element) => element.lineText.contains('CUI'));

    final nameIndex =
        lines.indexWhere((element) => element.lineText.contains('NOMBRE'));

    final lastnameIndex =
        lines.indexWhere((element) => element.lineText.contains('APELLIDO'));

    final nacionalityIndex = lines
        .indexWhere((element) => element.lineText.contains('NACIONALIDAD'));

    final sexIndex =
        lines.indexWhere((element) => element.lineText.contains('SEXO'));

    final dateOfBirthIndex = lines.indexWhere(
        (element) => element.lineText.contains('FECHA DE NACIMIENTO'));

    final countryOfBirthIndex =
        lines.indexWhere((element) => element.lineText.contains('PAIS DE NAC'));

    cui = lines[cuiIndex + 1].lineText;

    if (lines[nameIndex + 2].lineText.contains('APELLIDO')) {
      name = lines[nameIndex + 1].lineText;
    } else {
      name =
          '${lines[nameIndex + 1].lineText} ${lines[nameIndex + 2].lineText}';
    }

    if (lines[lastnameIndex + 1].lineText.contains('NACIONALIDAD')) {
      lastname = lines[lastnameIndex + 1].lineText;
    } else {
      lastname =
          '${lines[lastnameIndex + 1].lineText} ${lines[lastnameIndex + 2].lineText}';
    }

    nacionality = lines[nacionalityIndex + 1].lineText;
    sex = lines[sexIndex + 1].lineText;
    dateOfBirth = lines[dateOfBirthIndex + 1].lineText;
    countryOfBirth = lines[countryOfBirthIndex + 1].lineText;

    return ScannedText(
      name: name,
      lastname: lastname,
      cui: cui,
      nacionality: nacionality,
      dateOfBirth: dateOfBirth,
      countryOfBirth: countryOfBirth,
      sex: sex,
    );
  }
}
