# 랜덤 숫자 생성기
---
![res](https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbwpV1u%2FbtsozTYOUc1%2FHAOIbD6RBQPsvAkj5x2ej1%2Fimg.png)  
<br>

## 개발환경
- Flutter 3.10.6
- Dart 3.10
<br>

## 기능
- 홈스크린에서 상단바 newpaper 아이콘 누르면 세팅스크린으로 넘어감  
- 최대 값을 슬라이더로 지정(위 예시에서는 1000)  
- 저장 버튼 누르면 홈스크린으로 돌아감  
- 생성 버튼 누르면 세팅스크린에서 지정해 준 최대 값(1000) 이하의 값이 랜덤으로 생성   
<br>

## 주요 구성요소
- double.infinity: 버튼 너비 무한히 늘려주기
- EdgeInsert: 패딩 조정
- map(), toString(), split()을 이용해 이미지 편리하게 가져오기
- Navigation: 이동 원하는 스크린으로 넘어가기
- ElevatedButton.styleFrom(): 버튼 색상 변경
- Slider(): 슬라이더 설정
- Navigator.of(context).pop(): 페이지 뒤로 가기
- initState()
<br>

## 개발 노트
[랜덤 숫자 생성기](https://damio.tistory.com/122)  
<br>
