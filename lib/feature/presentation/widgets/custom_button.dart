import 'package:flutter_ocr_verifik/utils/export_files.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.content,
    required this.onPressed,
    this.backgroundColor,
  });

  final String content;
  final Function() onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: backgroundColor == null ? Colors.white : Colors.indigo,
        backgroundColor: backgroundColor ?? Colors.indigo,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      child: Text(content),
    );
  }
}
