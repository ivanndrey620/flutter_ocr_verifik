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
            return const DocumentDetailsScreen();
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
