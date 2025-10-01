import 'package:get_it/get_it.dart';
import 'package:ringcloud/app/bloc/app_bloc.dart';
import 'package:ringcloud/app/core/services/sip_service.dart';

final sl = GetIt.instance;

initializeServiceLocator() async {
  /// service
  sl.registerLazySingleton<SipService>(() => SipServiceImpl());

  /// bloc
  sl.registerLazySingleton<AppBloc>(() => AppBloc());
}
