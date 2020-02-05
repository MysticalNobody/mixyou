part of './res.dart';

ThemeData mainTheme = ThemeData(
  canvasColor: Colors.transparent,
  brightness: Brightness.light,
  primaryColor: MYColors.primary,
  accentColor: MYColors.bg,
  scaffoldBackgroundColor: MYColors.bg,
  backgroundColor: MYColors.bg,
  cardColor: MYColors.bg,
  toggleableActiveColor: MYColors.primary,
  iconTheme: IconThemeData(color: MYColors.primary),
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(color: MYColors.text),
    brightness: Brightness.light,
    color: MYColors.bg,
    iconTheme: IconThemeData(color: MYColors.text),
    textTheme: TextTheme(title: TextStyle(color: MYColors.text, fontSize: 16, fontWeight: FontWeight.bold)),
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
    },
  ),
  textTheme: TextTheme(title: TextStyle(color: MYColors.text)),
  buttonTheme: ButtonThemeData(buttonColor: MYColors.primary, textTheme: ButtonTextTheme.accent),
);