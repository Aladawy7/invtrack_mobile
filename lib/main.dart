import 'package:flutter/material.dart';
import 'package:invtrack/core/routes/app_routes.dart';

void main() {
  runApp(const InvTrack());
}

class InvTrack extends StatelessWidget {
  const InvTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoute.router,
    );
  }
}
