import 'package:flutter/material.dart';
import 'package:vvod/pages/another.dart';
import 'package:vvod/pages/password.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageRouteBuilder(pageBuilder: (_, __, ___) => Password());
          case '/another':
            return PageRouteBuilder(pageBuilder: (_, __, ___) => Another());
        }
      },
    ),
  );
}
