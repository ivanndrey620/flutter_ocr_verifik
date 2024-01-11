import 'package:flutter_ocr_verifik/utils/export_files.dart';

class DropzoneWidget extends StatefulWidget {
  final ValueChanged<DroppedFile> onDroppedFile;

  const DropzoneWidget({super.key, required this.onDroppedFile});

  @override
  State<DropzoneWidget> createState() => _DropzoneWidgetState();
}

class _DropzoneWidgetState extends State<DropzoneWidget> {
  late DropzoneViewController controller;

  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    return buildDecoration(
      child: Stack(
        children: [
          DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onHover: () => setState(() => isHighlighted = true),
            onLeave: () => setState(() => isHighlighted = false),
            onDrop: acceptFile,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      size: 80,
                      color: Colors.indigo,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.dragAndDrop,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          StringConstants.theIdDocument,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
                CustomButton(
                  content: StringConstants.findTheFile,
                  onPressed: () async {
                    final events = await controller.pickFiles();
                    if (events.isEmpty) return;

                    acceptFile(events.first);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = isHighlighted ? Colors.grey[300] : Colors.white;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 200,
          color: colorBackground,
          padding: const EdgeInsets.all(10),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.grey,
            strokeWidth: 3,
            dashPattern: const [8, 4],
            padding: EdgeInsets.zero,
            radius: const Radius.circular(10),
            child: child,
          ),
        ),
      ),
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    final droppedFile = DroppedFile(
      url: url,
      name: name,
      mime: mime,
      bytes: bytes,
    );

    widget.onDroppedFile(droppedFile);
    setState(() => isHighlighted = false);
  }
}
