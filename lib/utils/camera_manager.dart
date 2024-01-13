import 'package:flutter_ocr_verifik/utils/export_files.dart';

class CameraManager {
  BuildContext context;
  CameraController? controller;
  late List<CameraDescription> _cameras;
  Size? previewSize;
  bool isFinished = false;
  bool _isMobileWeb = false;

  CameraManager({
    required this.context,
    required this.cbRefreshUi,
    required this.cbIsMounted,
  });

  Function cbRefreshUi;
  Function cbIsMounted;

  void initState() {
    initCamera();
  }

  Future<void> stopVideo() async {
    if (controller == null) return;

    controller!.dispose();
    controller = null;
  }

  Future<void> webCamera() async {
    if (controller == null || isFinished || cbIsMounted() == false) return;

    // XFile file = await controller!.takePicture();
    // var results = await mrzDetector.recognizeByFile(file.path);
    // if (results == null || !cbIsMounted()) return;

    // mrzLines = results;
    cbRefreshUi();
    // handleMrz(results);

    if (!isFinished) {
      webCamera();
    }
  }

  Future<void> startVideo() async {
    isFinished = false;

    cbRefreshUi();

    webCamera();
  }

  Future<void> initCamera() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _cameras = await availableCameras();
      int index = 0;

      for (; index < _cameras.length; index++) {
        CameraDescription description = _cameras[index];
        if (description.name.toLowerCase().contains('back')) {
          _isMobileWeb = true;
          break;
        }
      }
      if (_cameras.isEmpty) return;

      if (_isMobileWeb) {
        toggleCamera(index);
      } else {
        toggleCamera(0);
      }
    } on CameraException catch (e) {
      throw ('Error is $e');
    }
  }

  Widget getPreview() {
    if (controller == null || !controller!.value.isInitialized || isFinished) {
      return const Text('No camera available!');
    }

    // if (kIsWeb && !_isMobileWeb) {
    //   return Transform(
    //     alignment: Alignment.center,
    //     transform: Matrix4.identity()..scale(-1.0, 1.0), // Flip horizontally
    //     child: CameraPreview(controller!),
    //   );
    // }

    return CameraPreview(controller!);
  }

  Future<void> toggleCamera(int index) async {
    if (controller != null) controller!.dispose();

    controller = CameraController(_cameras[index], ResolutionPreset.medium);
    controller!.initialize().then((_) {
      if (!cbIsMounted()) {
        return;
      }

      previewSize = controller!.value.previewSize;

      startVideo();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
  }
}
