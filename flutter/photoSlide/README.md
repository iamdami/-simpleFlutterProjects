# Photo Slide Show
---
## PageView  
![1](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fstm4J%2Fbtsn9TQxrhX%2Fr7rbGv0ktoeRVm8HpkY6Z1%2Fimg.png)  
PageView 이용해 사진 보여주기  
내 최애 손짱 사진으루,,🩵  

사진 이름이 son1.png, son2.png 등으로 끝에 숫자만 반복됨  
-> **functional programming** 해주기  

fit: BoxFit.cover 이용해 사진 확대해 **전체화면으로 보여지게** 하기  

## Timer
![2](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbtho7f%2Fbtsobch05Qv%2Fy2MhOLNYTwqoW8jkeyhUN1%2Fimg.png)    
타이머 걸어주기  
timer = Timer.periodic(Duration(seconds: _), (timer) {}  
초기 페이지 값은 0  
currentPage와 nextPage 설정해줬고  
다음 페이지값이 위 예시에서는 3보다 커질 경우 다시 초기 페이지로 돌아오게 했다  
(해당 프로젝트에서는 사진을 총 4장 넣어줬기 때문)  

페이지에 **애니메이션 효과**를 주었는데, (animateToPage)  
curve 값을 조정할 수 있다  
curve: Curves._  
slowMiddle로 했는데 활용할 수 있는 효과가 이외에도 많다  

## 그 외 기능
![3](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FJgAAj%2Fbtsn7xnoaHN%2F1hR0x7IvQjSRjzvm0oR4Bk%2Fimg.png)  
dispose() 로 **메모리릭(메모리 과소비) 방지**,  
**상태바 글씨 색 변경**(light / dark)  
