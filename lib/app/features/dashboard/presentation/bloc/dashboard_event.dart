part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class UpdateSipConnectionDashboardEvent extends DashboardEvent {
  final SipConnectionState sipConnectionState;

  UpdateSipConnectionDashboardEvent({required this.sipConnectionState});
}
