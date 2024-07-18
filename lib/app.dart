import 'package:bankomat/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bankomat/atm_feature/atm_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate>[
        S.delegate,
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', 'US'),
        Locale('pl', 'PL'),
      ],
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                fixedSize: const WidgetStatePropertyAll(Size(300, 56)),
                foregroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.disabled)
                    ? Theme.of(context).colorScheme.surfaceDim
                    : Theme.of(context).colorScheme.surface),
                textStyle: WidgetStateTextStyle.resolveWith((states) => Theme.of(context).textTheme.labelLarge!),
                side: WidgetStateBorderSide.resolveWith((states) => BorderSide(
                    color: states.contains(WidgetState.disabled)
                        ? Theme.of(context).colorScheme.outlineVariant
                        : Theme.of(context).colorScheme.outline)),
                backgroundColor: WidgetStateColor.resolveWith((states) => states.contains(WidgetState.disabled)
                    ? Theme.of(context).colorScheme.onInverseSurface
                    : Theme.of(context).colorScheme.onSurface))),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AtmScreen(),
    );
  }
}
