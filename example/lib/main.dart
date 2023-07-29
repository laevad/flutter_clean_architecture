import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import './src/app/pages/home/home_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterCleanArchitecture.debugModeOn();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(const Color(0xFF2196F3)),
          accentColor: const Color(0xFFFF9800),
          backgroundColor: const Color(0xFFF5F5F5),
          errorColor: const Color(0xFFFF0000),
          brightness: Brightness.light,
          cardColor: const Color(0xFFFFFFFF),
          primaryColorDark: const Color(0xFF1976D2),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Flutter Clean Architecture Demo'),
    );
  }
}

// For MaterialColor, since it doesn't have a constructor that takes a Color
MaterialColor createMaterialColor(Color color) {
  List<int> strengths = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  Map<int, Color> swatch = <int, Color>{};
  final int primary = color.value;
  for (int i = 0; i < 10; i++) {
    final int strength = strengths[i];
    final double opacity = i == 0 ? 0.05 : i / 10.0;
    final Color swatchColor = Color(primary).withOpacity(opacity);
    swatch[strength] = swatchColor;
  }
  return MaterialColor(color.value, swatch);
}
