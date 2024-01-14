import 'package:flutter_ocr_verifik/utils/export_files.dart';

class LivenessAndMatchResultsWidget extends StatelessWidget {
  const LivenessAndMatchResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: 'Liveness & Match results'),
        const SizedBox(height: 20),
        //
      ],
    );
  }
}
