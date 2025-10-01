import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringcloud/app/app_routes.dart';
import 'package:ringcloud/app/bloc/app_bloc.dart';
import 'package:ringcloud/app/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => sl<AppBloc>(), child: _App());
  }
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "RingCloud",
      routerConfig: AppRoutes.routerConfig,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.1)),
          child: child ?? SizedBox(),
        );
      },
    );
  }
}
