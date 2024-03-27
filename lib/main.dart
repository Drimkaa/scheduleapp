
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/core/utils/theme_switcher/theme_service.dart';
import 'package:scheduleapp/injection_container.dart';
import 'package:scheduleapp/presenter/bloc/edit/edit_bloc.dart';
import 'core/routing/routing.dart';
import 'core/utils/theme_switcher/animated_theme_switcher.dart';
import 'presenter/bloc/right_menu/right_menu_bloc.dart';
import 'presenter/bloc/week/week_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  final themeService = await ThemeService.instance;
  final appRouter = AppRouter();
  var initTheme = themeService.initial;




  runApp(
    ThemeProvider(
      initTheme: initTheme,
      builder: (context, theme) {
        return MultiBlocProvider(providers: [
          BlocProvider<WeekPageBloc>(create: (_) => sl<WeekPageBloc>()..add(GetSchedule())),
          BlocProvider<RightMenuBloc>(create: (_) => sl<RightMenuBloc>()),
          BlocProvider<EditBloc>(create: (_) => sl<EditBloc>())
        ], child: ThemeSwitchingArea(child:

         MyApp(theme: initTheme, router: appRouter)
        )

       );
      },
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.theme, required this.router});

  final AppRouter router;
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    var mySystemTheme = SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: MyColors.dark_3);
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    return MaterialApp.router(
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('ru', 'RU'), // English, no country code
        Locale('en', 'US'), // Arabic, no country code
      ],
      locale: const Locale('ru', 'RU'),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
      routerConfig: router.config(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
    );
  }
}
