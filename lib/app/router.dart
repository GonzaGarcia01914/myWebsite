import 'package:go_router/go_router.dart';
import 'package:portfolio_web/features/home/home_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        // Si te llegan anchors tipo: /#projects, /#experience...
        final initialAnchor = state.uri.fragment.isNotEmpty
            ? state.uri.fragment
            : null;
        return HomePage(initialAnchor: initialAnchor);
      },
    ),
  ],
);
