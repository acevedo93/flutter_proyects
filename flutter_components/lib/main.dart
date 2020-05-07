import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es')
      ],
      title: 'FLutter components',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getSettingsRoute(),
      // Cuando las rutas no existen
      onGenerateRoute: ( RouteSettings settings) {
        print('ruta llamada: ${settings.name}');
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
