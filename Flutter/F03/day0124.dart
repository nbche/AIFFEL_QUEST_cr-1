import 'package:flutter/material.dart';
import 'secondPage.dart';
import 'firstPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/first',
      onGenerateRoute: (settings) {
        // 동적 라우팅 처리
        if (settings.name == '/second') {
          final arguments = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            builder: (context) => SecondPageScreen(
              is_cat: arguments?['is_cat'] ?? false,
            ),
          );
        }
        return null; // 정의되지 않은 경로의 경우 null 반환
      },
      routes: {
        '/first': (context) => FirstPageScreen(),
      },
    );
  }
}
