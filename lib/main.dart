import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ringcloud/app/app.dart';

import 'app/service_locator.dart' show initializeServiceLocator;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize .env file
  await dotenv.load(fileName: "lib/.env");

  /// Initialize get it service locator
  await initializeServiceLocator();

  /// Initialize hydrated bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory(
              (await getApplicationDocumentsDirectory()).path,
            ),
  );

  runApp(const App());
}
