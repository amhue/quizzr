import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizzr/screens/homescreen.dart';
import 'package:quizzr/screens/quizscreen.dart';
import 'package:quizzr/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: "/", builder: (context, state) => Home()),
        GoRoute(
          path: "/quiz/:id",
          builder: (context, state) =>
              QuizScreen(id: int.parse(state.pathParameters['id'] ?? "0")),
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,

      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        brightness: Brightness.dark,
        textTheme: TextTheme(
          titleLarge: Style.titleTheme(Theme.of(context).colorScheme),
          titleSmall: Style.smallTitleTheme(Theme.of(context).colorScheme),
          bodySmall: Style.descTheme(Theme.of(context).colorScheme),
          bodyMedium: Style.bodyTheme(Theme.of(context).colorScheme),
        ),
        // appBarTheme: AppBarTheme(
        // titleTextStyle: Style.appBarTheme(Theme.of(context).colorScheme),
        // ),
      ),
    );
  }
}
