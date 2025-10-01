part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final SipConnectionState sipConnectionState;

  const DashboardState({required this.sipConnectionState});

  factory DashboardState.initial() {
    return DashboardState(sipConnectionState: SipConnectionState.loading);
  }

  DashboardState copyWith({SipConnectionState? sipConnectionState}) {
    return DashboardState(
      sipConnectionState: sipConnectionState ?? this.sipConnectionState,
    );
  }

  @override
  List<Object?> get props => [sipConnectionState];
}
