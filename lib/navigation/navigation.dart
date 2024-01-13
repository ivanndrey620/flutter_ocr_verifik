import 'package:flutter_ocr_verifik/feature/presentation/kyc_process/kyc_process_screen.dart';
import 'package:flutter_ocr_verifik/utils/export_files.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'idScaning',
          builder: (BuildContext context, GoRouterState state) {
            return const KycProcessScreen();
          },
        ),
      ],
    ),
  ],
);
