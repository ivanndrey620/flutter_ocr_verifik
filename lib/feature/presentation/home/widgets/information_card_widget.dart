import 'package:flutter_ocr_verifik/utils/export_files.dart';

class InformationCardWidget extends StatelessWidget {
  const InformationCardWidget(
      {super.key, required this.content, required this.id});

  final String content;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Card(
          margin: const EdgeInsets.only(bottom: 20.0),
          elevation: 20,
          child: SizedBox(
            width: 250,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(AssetsConstants.noImage),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: .0,
          left: .0,
          right: .0,
          child: Center(
            child: CircleAvatar(
              radius: 20.0,
              child: Text('$id'),
            ),
          ),
        )
      ],
    );
  }
}
