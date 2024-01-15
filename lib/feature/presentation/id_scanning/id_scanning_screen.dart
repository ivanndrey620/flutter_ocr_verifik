import 'package:flutter_ocr_verifik/utils/export_files.dart';

class IdScanningScreen extends StatelessWidget {
  const IdScanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRowWidget(
      rowOne: Column(
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
              builder: (ctx) => BlocProvider<AppBloc>.value(
                value: BlocProvider.of<AppBloc>(context),
                child: CustomDialog(
                  children: [
                    DropzoneWidget(onDroppedFile: (file) {
                      Navigator.pop(context);

                      context
                          .read<AppBloc>()
                          .add(OnDocumentScannedEvent(droppedFile: file));
                    }),
                    CustomButton(
                      backgroundColor: Colors.white,
                      content: StringConstants.cancel,
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      rowTwo: Column(
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
    );
  }
}
