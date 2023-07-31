import 'package:biatest/router/gen_route.dart';
import 'package:biatest/router/navigation_controller.dart';
import 'package:biatest/utils/assets/app_locale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:biatest/utils/app_global.dart' as global;

Future<void> app() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(EasyLocalization(
    supportedLocales: [AppLocales.en.language],
    path: AppLocales.path,
    fallbackLocale: AppLocales.en.language,
    startLocale: AppLocales.en.language,
    child: const App(),
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorObservers: [global.navigationObserver],
      theme: global.them,
      onGenerateRoute: generateRoute,
      navigatorKey: NavigationController.globalNavigatorKey,
    );
  }
}
