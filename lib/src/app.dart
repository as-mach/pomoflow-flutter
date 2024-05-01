import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/settings/notifications_view.dart';
import 'package:flutter_application_1/src/settings/timer_view.dart';
import 'package:flutter_application_1/src/settings/theme_view.dart';
import 'package:flutter_application_1/src/settings/sound_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'timer/flowtimer_details.dart';
import 'timer/pomotimer_details.dart';
import 'timer/timer_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
                scaffoldBackgroundColor: Color.fromARGB(255, 29, 35, 42),
                appBarTheme: AppBarTheme(
                  foregroundColor: Colors.white, //here you can give the text color
                  color: Color.fromARGB(255, 31, 41, 55)
                )
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case PomoDetailsView.routeName:
                    return PomoDetailsView();
                  case FlowDetailsView.routeName:
                    return FlowDetailsView();
                  case NotifDetailsView.routeName:
                    return const NotifDetailsView();
                  case ClockDetailsView.routeName:
                    return const ClockDetailsView();
                  case ThemeDetailsView.routeName:
                    return const ThemeDetailsView();
                  case SoundDetailsView.routeName:
                    return const SoundDetailsView();                                        
                  case TimerListView.routeName:
                  default:
                    return const TimerListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
