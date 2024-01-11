import 'package:flutter_ocr_verifik/utils/export_files.dart';

class IdScaningScreen extends StatelessWidget {
  const IdScaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[50],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomTitle(title: StringConstants.uploadYourId),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(AssetsConstants.noImage),
                  const SizedBox(height: 30),
                  CustomButton(
                    content: StringConstants.uploadFile,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        children: [
                          DropzoneWidget(onDroppedFile: (file) {}),
                          CustomButton(
                            content: StringConstants.cancel,
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomTitle(title: StringConstants.scanYourId),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(AssetsConstants.noImage),
                  const SizedBox(height: 30),
                  CustomButton(
                    content: StringConstants.startScanning,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // return BlocProvider(
    //   create: (context) => locator.get<OcrProcessBloc>(),
    //   child: Scaffold(
    //     appBar: AppBar(),
    //     body: Center(
    //       child: BlocBuilder<OcrProcessBloc, OcrProcessState>(
    //         builder: (context, state) => Column(
    //           children: [
    //             state.when(
    //               initial: () => const SizedBox.shrink(),
    //               loading: () => const CircularProgressIndicator(),
    //               loaded: (result) {
    //                 final lines = result.parsedResults.first.textOverlay.lines;

    //                 String name = '';
    //                 String lastname = '';
    //                 String cui = '';
    //                 String nacionality = '';
    //                 String dateOfBirth = '';
    //                 String countryOfBirth = '';
    //                 String sex = '';

    //                 final cuiIndex = lines.indexWhere(
    //                     (element) => element.lineText.contains('CUI'));

    //                 final nameIndex = lines.indexWhere(
    //                     (element) => element.lineText.contains('NOMBRE'));

    //                 final lastnameIndex = lines.indexWhere(
    //                     (element) => element.lineText.contains('APELLIDO'));

    //                 final nacionalityIndex = lines.indexWhere(
    //                     (element) => element.lineText.contains('NACIONALIDAD'));

    //                 final sexIndex = lines.indexWhere(
    //                     (element) => element.lineText.contains('SEXO'));

    //                 final dateOfBirthIndex = lines.indexWhere((element) =>
    //                     element.lineText.contains('FECHA DE NACIMIENTO'));

    //                 final countryOfBirthIndex = lines.indexWhere(
    //                     (element) => element.lineText.contains('PAIS DE NAC'));

    //                 cui = lines[cuiIndex + 1].lineText;

    //                 if (lines[nameIndex + 2].lineText.contains('APELLIDO')) {
    //                   name = lines[nameIndex + 1].lineText;
    //                 } else {
    //                   name =
    //                       '${lines[nameIndex + 1].lineText} ${lines[nameIndex + 2].lineText}';
    //                 }

    //                 if (lines[lastnameIndex + 1]
    //                     .lineText
    //                     .contains('NACIONALIDAD')) {
    //                   lastname = lines[lastnameIndex + 1].lineText;
    //                 } else {
    //                   lastname =
    //                       '${lines[lastnameIndex + 1].lineText} ${lines[lastnameIndex + 2].lineText}';
    //                 }

    //                 nacionality = lines[nacionalityIndex + 1].lineText;
    //                 sex = lines[sexIndex + 1].lineText;
    //                 dateOfBirth = lines[dateOfBirthIndex + 1].lineText;
    //                 countryOfBirth = lines[countryOfBirthIndex + 1].lineText;

    //                 return Text(
    //                     'Name is $name - lastname is $lastname - dpi is $cui - nacionality $nacionality - date of birth $dateOfBirth - country of birth $countryOfBirth - sex is $sex');
    //               },
    //               error: (error) => Text('Error $error'),
    //             ),
    //             ElevatedButton(
    //               onPressed: () => context
    //                   .read<OcrProcessBloc>()
    //                   .add(GetTextFromImageEvent()),
    //               child: const Text(
    //                 'Seleccionar imagen',
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
