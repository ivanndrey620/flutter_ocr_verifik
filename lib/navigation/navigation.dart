import 'package:flutter_ocr_verifik/feature/presentation/id_scaning/screens/id_scaning_screen.dart';
import 'package:flutter_ocr_verifik/utils/export_files.dart';
import 'package:go_router/go_router.dart';

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
      ],
    ),
  ],
);
