import 'package:flutter/material.dart';
import 'secondPage.dart'; // SecondPageScreen이 정의된 파일을 가져옴
import 'firstPage.dart'; // FirstPageScreen이 정의된 파일을 가져옴

// 앱의 진입점
void main() {
  runApp(MyApp()); // Flutter 앱을 실행하는 메인 함수
}

// 앱의 최상위 위젯
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // DEBUG 모드 배너 제거
      initialRoute: '/first', // 앱 실행 시 초기 경로를 '/first'로 설정
      onGenerateRoute: (settings) {
        // 동적 라우팅 처리를 위한 함수
        if (settings.name == '/second') {
          // '/second' 경로가 호출되었을 때
          final arguments = settings.arguments as Map<String, dynamic>?; 
          // 전달된 인자를 Map 형식으로 받음. null일 수도 있음
          
          return MaterialPageRoute(
            // MaterialPageRoute를 사용해 SecondPageScreen으로 이동
            builder: (context) => SecondPageScreen(
              is_cat: arguments?['is_cat'] ?? false, 
              // 'is_cat' 값을 받아서 SecondPageScreen으로 전달. 
              // 전달된 값이 없으면 기본값(false)로 설정
            ),
          );
        }
        return null; // 경로가 정의되지 않은 경우 null 반환
      },
      routes: {
        // 정적 라우팅 설정
        '/first': (context) => FirstPageScreen(), 
        // '/first' 경로에 FirstPageScreen을 매핑
      },
    );
  }
}
