import 'package:biatest/app.dart';

import 'config/app_config.dart';
import 'environment/environment.dart';

Future<void> main() async {
  AppConfig(env: Environment.production());
  await App();
}
