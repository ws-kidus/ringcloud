import 'package:get_it/get_it.dart';
import 'package:ringcloud/app/bloc/app_bloc.dart';

final sl = GetIt.instance;

initializeServiceLocator() async {
  /// bloc
  sl.registerLazySingleton<AppBloc>(() => AppBloc());
}
