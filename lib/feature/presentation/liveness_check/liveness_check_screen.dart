import 'package:flutter_ocr_verifik/utils/export_files.dart';

class LivenessCheckScreen extends StatefulWidget {
  const LivenessCheckScreen({
    super.key,
    required this.droppedFile,
  });

  final DroppedFile droppedFile;

  @override
  State<LivenessCheckScreen> createState() => _LivenessCheckScreenState();
}

class _LivenessCheckScreenState extends State<LivenessCheckScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      locator.get<CameraDescription>(),
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: size.height / 1.5,
                    child: CameraPreview(
                      _controller,
                      child: Center(
                        child: Container(
                          width: size.width / 4,
                          height: size.height / 1.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 3.0,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.elliptical(200, 300),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    try {
                      //       // Ensure that the camera is initialized.
                      await _initializeControllerFuture;

                      // Attempt to take a picture and get the file `image`
                      // where it was saved.
                      final image = await _controller.takePicture();

                      if (!mounted) return;

                      // If the picture was taken, display it on a new screen.

                      context.read<AppBloc>().add(OnShowResultsEvent(
                            droppedFile: widget.droppedFile,
                            xFile: image,
                          ));
                    } catch (e) {
                      throw ('Error is $e');
                    }
                  },
                  icon: const Icon(Icons.camera_alt),
                )
              ],
            ),
          );
        }
        // Otherwise, display a loading indicator.
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
