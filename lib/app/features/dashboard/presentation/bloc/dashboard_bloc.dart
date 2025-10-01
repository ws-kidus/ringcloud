import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ringcloud/app/core/services/sip_service.dart';
import 'package:ringcloud/app/service_locator.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final _sipService = sl<SipService>();

  StreamSubscription<SipConnectionState>? _sub;

  DashboardBloc() : super(DashboardState.initial()) {
    on<UpdateSipConnectionDashboardEvent>(
      (event, emit) =>
          emit(state.copyWith(sipConnectionState: event.sipConnectionState)),
    );

    _sub = _sipService.getConnectionStatus().listen(
      (value) =>
          add(UpdateSipConnectionDashboardEvent(sipConnectionState: value)),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
