import 'package:flutter_ocr_verifik/feature/presentation/liveness_check/bloc/liveness_check_bloc.dart';
import 'package:flutter_ocr_verifik/utils/export_files.dart';
import 'package:flutter_ocr_verifik/utils/overlay_util.dart';

class LivenessCheckScreen extends StatefulWidget {
  const LivenessCheckScreen({super.key});

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

    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: size.width / 1.3,
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
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  bottom: 0,
                  left: 0.0,
                  child: createOverlay(),
                ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  xFile: image,
                ),
              ),
            );
          } catch (e) {
            throw ('Error is $e');
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final XFile xFile;

  const DisplayPictureScreen({super.key, required this.xFile});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<LivenessCheckBloc>(),
      child: BlocBuilder<LivenessCheckBloc, LivenessCheckState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Display the Picture')),
            // The image is stored as a file on the device. Use the `Image.file`
            // constructor with the given path to display the image.
            body: Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.network(xFile.path),
                ),
                const SizedBox(height: 20),
                state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const CircularProgressIndicator(),
                  loaded: (livenessDetectionResult) => Text(
                      'The photo is ${livenessDetectionResult.result} - score ${livenessDetectionResult.score}'),
                  error: (error) => Text('Error is $error'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context
                      .read<LivenessCheckBloc>()
                      .add(OnLivenessCheckEvent(xFile: xFile)),
                  child: const Text('take picture'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter_ocr_verifik/utils/camera_manager.dart';
// import 'package:flutter_ocr_verifik/utils/export_files.dart';
// import 'package:flutter_ocr_verifik/utils/overlay_util.dart';

// class LivenessCheckScreen extends StatefulWidget {
//   const LivenessCheckScreen({super.key});

//   @override
//   State<LivenessCheckScreen> createState() => _LivenessCheckScreenState();
// }

// class _LivenessCheckScreenState extends State<LivenessCheckScreen>
//     with WidgetsBindingObserver {
//   late CameraManager _mobileCamera;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);

//     _mobileCamera = CameraManager(
//       context: context,
//       cbRefreshUi: refreshUI,
//       cbIsMounted: isMounted,
//     );
//     _mobileCamera.initState();
//   }

//   void refreshUI() {
//     setState(() {});
//   }

//   bool isMounted() {
//     return mounted;
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _mobileCamera.stopVideo();
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (_mobileCamera.controller == null ||
//         !_mobileCamera.controller!.value.isInitialized) {
//       return;
//     }

//     if (state == AppLifecycleState.inactive) {
//       _mobileCamera.controller!.dispose();
//     } else if (state == AppLifecycleState.resumed) {
//       _mobileCamera.toggleCamera(0);
//     }
//   }

//   List<Widget> createCameraPreview() {
//     if (_mobileCamera.controller != null && _mobileCamera.previewSize != null) {
//       return [
//         SizedBox(
//             width: MediaQuery.of(context).size.width <
//                     MediaQuery.of(context).size.height
//                 ? _mobileCamera.previewSize!.height
//                 : _mobileCamera.previewSize!.width,
//             height: MediaQuery.of(context).size.width <
//                     MediaQuery.of(context).size.height
//                 ? _mobileCamera.previewSize!.width
//                 : _mobileCamera.previewSize!.height,
//             child: _mobileCamera.getPreview()),
//         Positioned(
//           top: 0.0,
//           right: 0.0,
//           bottom: 0,
//           left: 0.0,
//           child: createOverlay(),
//         ),
//         Positioned(
//           top: 100,
//           left: 100,
//           right: 100,
//           bottom: 100,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.white,
//                 width: 3.0,
//               ),
//               borderRadius: BorderRadius.circular(10.0),
//               color: Colors.transparent,
//             ),
//           ),
//         ),
//       ];
//     } else {
//       return [
//         const CircularProgressIndicator(),
//       ];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () async {
//           return true;
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.black,
//             title: const Text(
//               'MRZ Scanner',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           body: Stack(
//             children: <Widget>[
//               if (_mobileCamera.controller != null &&
//                   _mobileCamera.previewSize != null)
//                 Positioned(
//                   top: 0,
//                   right: 0,
//                   left: 0,
//                   bottom: 0,
//                   child: FittedBox(
//                     fit: BoxFit.cover,
//                     child: Stack(
//                       children: createCameraPreview(),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ));
//   }
// }
