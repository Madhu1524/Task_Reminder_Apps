import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_apps/db/db.helper.dart';
import 'package:todo_apps/helpers/ScreenID.dart';
import 'package:todo_apps/services/theme_services.dart';
import 'package:todo_apps/theme/theme.dart';
import 'package:todo_apps/ui/login.dart';
import 'package:todo_apps/ui/signin/view/signin.dart';
import 'package:todo_apps/ui/signin/view/signinForm.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: const LoginUI(),
      routes: {
        ScreenID.signin: (context) => const SigninUI(),
        ScreenID.signupForm: (context) => const SigninForm(),
        ScreenID.loginUi: (context) => const LoginUI(),
      },
    );
  }
}
