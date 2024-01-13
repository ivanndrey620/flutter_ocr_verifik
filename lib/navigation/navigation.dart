import 'package:flutter_ocr_verifik/feature/presentation/liveness_check/liveness_check_screen.dart';
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
            return const IdScaningScreen();
          },
        ),
        GoRoute(
          path: 'livenessCheck',
          builder: (BuildContext context, GoRouterState state) {
            return const LivenessCheckScreen();
          },
        ),
      ],
    ),
  ],
);
