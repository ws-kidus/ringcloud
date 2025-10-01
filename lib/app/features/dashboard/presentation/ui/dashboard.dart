import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ringcloud/app/core/services/sip_service.dart';
import 'package:ringcloud/app/features/dashboard/presentation/ui/connection_display.dart';
import 'package:ringcloud/app/service_locator.dart';

class Dashboard extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final String location;

  const Dashboard({
    super.key,
    required this.navigationShell,
    required this.location,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _sipService = sl<SipService>();

  _initializeSip() async {
    _sipService.init();
    _sipService.connect();
  }

  @override
  void initState() {
    _initializeSip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ConnectionDisplay()],
          ),
        ],
      ),
    );
  }
}
