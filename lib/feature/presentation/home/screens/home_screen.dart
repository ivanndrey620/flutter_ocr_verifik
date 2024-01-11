import 'package:flutter_ocr_verifik/feature/presentation/widgets/custom_button.dart';
import 'package:flutter_ocr_verifik/utils/export_files.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int id = 1;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Image.asset(AssetsConstants.logo),
              ),
              const SizedBox(height: 20),
              const Text(
                StringConstants.exploreTheFuture,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  StringConstants.weFeatureCulting,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  StringConstants.discoverHow,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 20,
                children: [
                  InformationCardWidget(
                    content: StringConstants.scanYourId,
                    id: id++,
                  ),
                  InformationCardWidget(
                    content: StringConstants.obtainAndVerify,
                    id: id++,
                  ),
                  InformationCardWidget(
                    content: StringConstants.livenessDetection,
                    id: id++,
                  ),
                  InformationCardWidget(
                    content: StringConstants.getYourIdentity,
                    id: id++,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                content: 'Start',
                onPressed: () => print('hola'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
