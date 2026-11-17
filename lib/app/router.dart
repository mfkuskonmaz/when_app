import 'package:go_router/go_router.dart';

import '../features/subscriptions/presentation/home_page.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);