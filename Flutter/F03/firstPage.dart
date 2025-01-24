import 'package:flutter/material.dart';

// FirstPageScreen 클래스 정의 (첫 번째 페이지)
class FirstPageScreen extends StatelessWidget {
  // is_cat 변수 정의: 고양이인지 여부를 나타내는 boolean 값, 초기값은 true
  bool is_cat = true;

  @override
  Widget build(BuildContext context) {
    // 첫 번째 페이지의 전체 UI 구성
    return MaterialApp(
      debugShowCheckedModeBanner: false, // DEBUG 모드 배너 제거
      home: Scaffold(
        // 앱 화면의 기본 구조
        appBar: AppBar(
          // 상단 AppBar 구성
          backgroundColor: Colors.blueAccent, // AppBar 배경 색상
          foregroundColor: Colors.white, // AppBar의 텍스트 및 아이콘 색상
          elevation: 4.0, // AppBar의 그림자 높이
          centerTitle: true, // 제목을 중앙에 배치
          title: Text(
            'First Page', // AppBar 제목
            style: TextStyle(
              fontSize: 24.0, // 제목 글씨 크기
              fontWeight: FontWeight.bold, // 제목 글씨 두께
            ),
          ),
          leading: Padding(
            // AppBar 좌측 상단 아이콘
            padding: const EdgeInsets.all(8.0), // 아이콘 주변 여백
            child: ClipOval(
              // 아이콘을 원형으로 자르기
              child: Image.asset(
                'images/animal/cat_p.png', // 로컬 이미지 경로
                fit: BoxFit.cover, // 이미지의 비율을 유지하며 컨테이너에 맞춤
              ),
            ),
          ),
        ),
        body: Container(
          // 화면 전체 배경
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // 상단에서 하단으로 그라데이션 배경
              colors: [Colors.orangeAccent, Colors.pinkAccent], // 색상
              begin: Alignment.topCenter, // 그라데이션 시작점
              end: Alignment.bottomCenter, // 그라데이션 끝점
            ),
          ),
          child: Center(
            // 화면의 중앙에 배치
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 세로 방향 중앙 정렬
              children: [
                // 'Next' 버튼
                ElevatedButton(
                  onPressed: () {
                    // 버튼을 눌렀을 때의 동작
                    Navigator.pushNamed(
                      context, // 현재 페이지의 context 전달
                      '/second', // 두 번째 페이지로 이동
                      arguments: {
                        'is_cat': false, // is_cat 값을 false로 전달
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // 버튼 스타일 설정
                    backgroundColor: Colors.deepPurple, // 버튼 배경 색상
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ), // 버튼 안의 내용 여백
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // 버튼 모서리 둥글게
                    ),
                  ),
                  child: Text(
                    'Next', // 버튼 텍스트
                    style: TextStyle(
                      fontSize: 20.0, // 텍스트 크기
                      fontWeight: FontWeight.bold, // 텍스트 두께
                      color: Colors.white, // 텍스트 색상
                    ),
                  ),
                ),
                SizedBox(height: 30), // 버튼과 이미지 사이 여백
                GestureDetector(
                  // 터치 감지를 위한 위젯
                  onTap: () {
                    // 이미지를 눌렀을 때 동작
                    print('is_cat: $is_cat'); // is_cat 값 출력
                  },
                  child: Container(
                    // 이미지 주변 스타일 설정
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0), // 이미지 모서리 둥글게
                      boxShadow: [
                        // 그림자 효과 추가
                        BoxShadow(
                          color: Colors.black26, // 그림자 색상
                          blurRadius: 8.0, // 그림자 흐림 정도
                          offset: Offset(0, 4), // 그림자 위치
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      // 이미지를 둥글게 자르기
                      borderRadius: BorderRadius.circular(16.0), // 둥근 모서리 반경
                      child: Image.asset(
                        'images/animal/cat.png', // 로컬 이미지 경로
                        width: 300, // 이미지 너비
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
