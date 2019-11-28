import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_native/views/index_page/index.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return NamedRouter.initApp();
  }
}

class NamedRouter {
  static Map<String, WidgetBuilder> routes;

  // 初始化App
  static Widget initApp() {
    return new OKToast(
      textStyle: TextStyle(fontSize: 38),
        radius: 5,
        child: new MaterialApp(
          // debugShowCheckedModeBanner: false,
          title: 'Tuhu demo',
          theme: ThemeData(
            primarySwatch: Colors.blue
          ),
          // localizationsDelegates: [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          // ],
          // Tells the system which are the supported languages
          // supportedLocales: allTranslations.supportedLocales(),
          initialRoute: '/',
          routes: NamedRouter.initRoutes(),
        ),
    );
  }

  // 初始化路由
  static initRoutes() {
    routes = {
      '/': (context) => IndexPage(),
      // 'AdminIndex': (context) => AdminIndexPage(),
    };
    return routes;
  }
}
