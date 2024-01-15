import 'package:flutter_ocr_verifik/utils/export_files.dart';

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({
    super.key,
    required this.rowOne,
    required this.rowTwo,
  });

  final Widget rowOne;
  final Widget rowTwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            color: Colors.blue[50],
            child: rowOne,
          ),
        ),
        Expanded(
          child: Container(
            height: double.infinity,
            color: Colors.white,
            child: rowTwo,
          ),
        ),
      ],
    );
  }
}
