import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_flutter/resources.dart';
import 'package:starter_flutter/screens/authentication/sign_up_screen.dart';
import 'package:starter_flutter/utils/app_localizations.dart';

class StarterApp extends StatefulWidget {
  const StarterApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    final state = context.findAncestorStateOfType<_StarterAppState>();
    state?._changeLanguage(newLocale);
  }

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  _StarterAppState createState() => _StarterAppState();
}

class _StarterAppState extends State<StarterApp> {
  Locale? _locale;

  void _changeLanguage(Locale locale) {
    if (_locale != locale) {
      WidgetsBinding.instance
          ?.addPostFrameCallback((_) => setState(() => _locale = locale));
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocales = Locales.appLocales.keys.toList();

    return ScreenUtilInit(
      designSize:
          const Size(DesignConstants.designWidth, DesignConstants.designHeight),
      builder: () {
        return ValueListenableBuilder(
          valueListenable: StarterApp.themeNotifier,
          builder: (_, ThemeMode currentMode, __) {
            return MaterialApp(
                title: 'Starter app',
                theme: ThemeData(primarySwatch: Colors.blue),
                darkTheme: ThemeData.dark(),
                themeMode: currentMode,
                locale: _locale,
                supportedLocales: [
                  ...List.generate(appLocales.length, (localeIdx) {
                    final language = appLocales[localeIdx];
                    final country = Locales.appLocales[language];
                    return Locale(language, country);
                  }),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  for (final supportedLocale in supportedLocales) {
                    if (locale?.languageCode == supportedLocale.languageCode) {
                      return locale;
                    }
                  }
                  return supportedLocales.first;
                },
                initialRoute: '/',
                onGenerateRoute: (RouteSettings settings) {
                  switch (settings.name) {
                    //case '/': return MaterialPageRoute(builder: (context) => const DefaultScreen());
                    // case '/': return MaterialPageRoute(builder: (context) =>  LoginScreen());
                    // case '/': return MaterialPageRoute(builder: (context) =>  ResetPasswordScreen());
                    case '/':
                      return MaterialPageRoute(
                          builder: (context) => SignUpScreen());
                    // case '/': return MaterialPageRoute(builder: (context) =>  HomeScreen());

                  }
                  return MaterialPageRoute(builder: (context) => Container());
                });
          },
        );
      },
    );
  }
}
