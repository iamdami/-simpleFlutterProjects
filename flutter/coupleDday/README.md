# Couple D-Day App
### 하트 아이콘 누르면 CupertinoDialog로 만난 날짜 입력받고, 만난 날짜와 디데이를 계산해 띄워준다
---
![1](https://img1.daumcdn.net/thumb/R300x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FckMltj%2Fbtsoa9OuLL9%2FP8wKChB5h6cFItrjbW5yNk%2Fimg.png)  
![2](https://img1.daumcdn.net/thumb/R300x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F9OQgV%2FbtsogYkpwhC%2FstB94NiZswH4sWPDSxwPMK%2Fimg.png)  
---

## Google Font  
[프로젝트에서 사용할 글씨체 다운](https://fonts.google.com/?subset=korean)  

## asset 구성
lib > asset dir안에 img, font 폴더를 각각 생성해 img와 font 파일을 넣어준다  
![asset](https://img1.daumcdn.net/thumb/R550x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F9ZKFq%2FbtsogYxUsC9%2FToP09KjEJZ3jfgZ0aoMzg1%2Fimg.png)  
pubspec.yaml은 위 이미지 참고해 작성해준다  

## Text, Img 구성
![Text](https://img1.daumcdn.net/thumb/R550x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fu8Tne%2Fbtsoba0SxBI%2FDV2jIoB9XG9i9y57kRCuHk%2Fimg.png)  
텍스트 부분과 이미지 부분 상, 하 부분으로 나눠 진행 -> Column  
"The First Day We met" 부분과 "2022. 9. 17" 부분은 줄 간격을 띄우고 싶지 않기에 둘은 또 안에 Column으로 묶어준다  
 
텍스트들과 아이콘 부분 전체의 Column을 Expanded하고  
mainAxisAlignment의 spaceEvenly 이용해 간격 적절히 넓혀준다  

![Img](https://img1.daumcdn.net/thumb/R500x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbbGldw%2FbtsoiZCRsxs%2FZq9bbFjdk6c3YLui8xHYk0%2Fimg.png)  
이미지 부분도 Expanded 해서 상, 하 각 부분이 각자의 영역 밖으로는 넘어오지 못하게끔 설정한다  

## DateTime, CupertinoDialog
![onPressed](https://img1.daumcdn.net/thumb/R550x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcufQta%2FbtsofsGyoN7%2F0wyg6NhMeGRCndpidaXKWk%2Fimg.png)  
![CupertinoDialog](https://img1.daumcdn.net/thumb/R550x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FETVnY%2FbtsohoiPxW8%2FpKvQSiSBfwQ2Nqfgi36EpK%2Fimg.png)  
하트 아이콘 누르면 CupertinoDialog 창이 뜬다  
CupertinoDialog 옵션 적절히 설정  

DateTime 이용해 날짜 지정  
그 날짜가 곧 selectedDate가 된다  

처음 사귄 날짜를 지정해야지, 미래 날짜를 지정하면 안되기 때문에 그에 따른 설정을 했다  
(CupertinoDatePicker 부분 참고)  

## ThemeData
![ThemeData1](https://img1.daumcdn.net/thumb/R500x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fmso3V%2FbtsofQNUSo5%2FAcQGsjFzoW3wRyUWKlWZtk%2Fimg.png)  
![ThemeData2](https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fda8bgQ%2FbtsoeA53uJ7%2FxucBF4sp6yYhAKYwcOawxK%2Fimg.png)  
각각 main.dart와 home_screen.dart  

많이 사용되는 폰트는 fontFamily로 기본 값 설정해주면 TextStyle에 fontFamily 지정 않을 경우 기본 값으로 설정한 폰트로 보여진다  
(중복 코드 삭제할 수 있어 좋다)  

html에서 ```<h1>, <h2>``` 등으로 지정하듯이 여기는 displayLarge, bodyLarge 등으로 지정해주는 듯하다  
업버전되면서 headline1, bodytext1 -> displayLarge, bodyLarge 이런 식으로 바뀐 듯!  

하트 아이콘과 사귄 날짜 띄우기, 디데이 카운트에 관한 코드는 README에서는 생략했다  


 
