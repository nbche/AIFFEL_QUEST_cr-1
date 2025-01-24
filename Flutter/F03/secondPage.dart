import 'package:flutter/material.dart';

// SecondPageScreen 클래스 정의: 두 번째 페이지 화면
class SecondPageScreen extends StatelessWidget {
  // 'is_cat' 변수를 받는 명명된 매개변수
  final bool is_cat;

  // 생성자 정의: 'required' 키워드로 is_cat 값 전달 필수화
  SecondPageScreen({required this.is_cat});

  @override
  Widget build(BuildContext context) {
    // 두 번째 페이지의 전체 UI 구성
    return MaterialApp(
      debugShowCheckedModeBanner: false, // DEBUG 모드 배너 제거
      home: Scaffold(
        // 앱 화면의 기본 구조
        appBar: AppBar(
          backgroundColor: Colors.blueAccent, // AppBar 배경 색상
          foregroundColor: Colors.white, // AppBar 텍스트 및 아이콘 색상
          elevation: 4.0, // AppBar의 그림자 높이
          centerTitle: true, // AppBar 제목을 중앙에 배치
          title: Text(
            'Second Page', // AppBar 제목
            style: TextStyle(
              fontSize: 24.0, // 제목 텍스트 크기
              fontWeight: FontWeight.bold, // 제목 텍스트 두께
            ),
          ),
          leading: Padding(
            // AppBar 좌측 상단 아이콘 설정
            padding: const EdgeInsets.all(8.0), // 아이콘 주변 여백
            child: ClipOval(
              // 아이콘을 원형으로 자르기
              child: Image.asset(
                'images/animal/dog_p.png', // 강아지 아이콘 이미지 경로
                fit: BoxFit.cover, // 이미지를 컨테이너 크기에 맞추어 비율 유지
              ),
            ),
          ),
        ),
        body: Container(
          // 페이지 배경 설정
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // 상단에서 하단으로 이어지는 그라데이션 배경
              colors: [Colors.greenAccent, Colors.teal], // 그라데이션 색상
              begin: Alignment.topCenter, // 그라데이션 시작점
              end: Alignment.bottomCenter, // 그라데이션 끝점
            ),
          ),
          child: Center(
            // 콘텐츠를 화면 중앙에 배치
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 세로 방향 중앙 정렬
              children: [
                // 'Back' 버튼
                ElevatedButton(
                  onPressed: () {
                    // 버튼을 눌렀을 때 이전 페이지로 이동
                    Navigator.pop(context, '/first');
                  },
                  style: ElevatedButton.styleFrom(
                    // 버튼 스타일 정의
                    backgroundColor: Colors.deepOrange, // 버튼 배경 색상
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0, // 버튼 가로 여백
                      vertical: 12.0, // 버튼 세로 여백
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // 버튼 모서리를 둥글게 설정
                    ),
                  ),
                  child: Text(
                    'Back', // 버튼 텍스트
                    style: TextStyle(
                      fontSize: 20.0, // 텍스트 크기
                      fontWeight: FontWeight.bold, // 텍스트 두께
                      color: Colors.white, // 텍스트 색상
                    ),
                  ),
                ),
                SizedBox(height: 30), // 버튼과 이미지 사이 여백
                GestureDetector(
                  // 이미지를 터치할 수 있도록 감지
                  onTap: () {
                    // 이미지를 눌렀을 때 콘솔에 is_cat 값 출력
                    print('is_cat: $is_cat');
                  },
                  child: Container(
                    // 이미지 컨테이너 스타일
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0), // 컨테이너 모서리를 둥글게
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // 그림자 색상
                          blurRadius: 8.0, // 그림자 흐림 정도
                          offset: Offset(0, 4), // 그림자 위치
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      // 이미지를 둥근 모서리로 자르기
                      borderRadius: BorderRadius.circular(16.0), // 둥근 모서리 반경
                      child: Image.asset(
                        'images/animal/dog.png', // 강아지 이미지 경로
                        width: 300, // 이미지 너비
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // 이미지와 텍스트 사이 여백
                Text(
                  // 고양이 상태에 따라 텍스트를 표시
                  is_cat ? 'This is a cat!' : 'This is not a cat!', // 조건부 텍스트
                  style: TextStyle(
                    fontSize: 20.0, // 텍스트 크기
                    fontWeight: FontWeight.w500, // 텍스트 두께
                    color: Colors.white, // 텍스트 색상
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
