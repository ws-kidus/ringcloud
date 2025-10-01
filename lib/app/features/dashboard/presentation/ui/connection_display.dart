import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringcloud/app/core/services/sip_service.dart';
import 'package:ringcloud/app/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class ConnectionDisplay extends StatelessWidget {
  const ConnectionDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final sipConnectionState = context.select(
      (DashboardBloc bloc) => bloc.state.sipConnectionState,
    );
    switch (sipConnectionState) {
      case SipConnectionState.loading:
        return Text("loading...");
      case SipConnectionState.connected:
        return Text("connected");
      case SipConnectionState.disconnected:
        return Text("disconnected");
    }
  }
}
