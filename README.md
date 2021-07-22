# 당근마켓 홈화면 클론 코딩

| 홈 화면 (상품 목록)                                          | 언어 설정 화면                                               | 홈 화면 (지역 변경)                                          |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| ![Simulator Screen Recording - iPhone 12 mini - 2021-07-22 at 07 24 48](https://user-images.githubusercontent.com/12438429/126567992-ab7d6f14-995d-4349-ac31-dd805b43f470.gif) | ![Simulator Screen Recording - iPhone 12 mini - 2021-07-22 at 07 26 22](https://user-images.githubusercontent.com/12438429/126567979-788aee0b-0864-41d7-974d-c3b54c221782.gif) | ![Simulator Screen Recording - iPhone 12 mini - 2021-07-22 at 07 25 28](https://user-images.githubusercontent.com/12438429/126567990-298efb9b-2d86-48e2-b463-2251b9cd94e4.gif) |



> * '홍제동', '수내1동'을 이미 자신의 동네로 등록한 사용자라는 가정
> * 앱 처음 실행시 '홍제동'을 임의로 설정함 
> * 이를 위한 Mock JSON 파일을 프로젝트 내에 저장



## *기능

### 홈 - 상품 목록 화면

* 전체 상품 목록을 확인할 수 있음
* 상품에 대한 판매 상태, 게시 시간, 끌올 여부, 가격, 지역 등의 정보를 확인할 수 있음
* 예약중이거나 판매 완료된 상품은 별도의 표시로 쉽게 구분할 수 있음
* 상품을 확인할 내 동네를 변경할 수 있음



### 언어 설정 화면

* 한국어/영어/영어(영국)/영어(캐나다)/일본어 설정 가능함



### 그 외

* 다크모드 대응



## * 구조

### MVC(Model - View - Controller) 아키텍처



## * Unit test

* 67.5 % Code Coverage

![image](https://user-images.githubusercontent.com/12438429/126574603-dd61f8d6-7a85-4f33-ae28-291b5ad7c2de.png)



## * 역할

### 화면 관련

| Class 이름                    | 역할                                                         |
| ----------------------------- | ------------------------------------------------------------ |
| HomeViewController            | 홈 화면. [Product] 타입의 객체에 해당하는 상품 전체 목록을 보여줌. |
| HomeTableViewCell             | 홈 화면의 테이블뷰셀.                                        |
| LanguageSettingViewController | 언어 설정 화면. 앱 내에서 사용할 언어를 변경할 수 있음.      |
| PlaceSettingViewController    | 동네 선택 팝업 화면. 상품 목록을 확인할 동네를 설정할 수 있음. |



### 로직 관련

| Class 이름  | 역할                                                 |
| ----------- | ---------------------------------------------------- |
| JSONManager | JSON 데이터를 특정 타입으로 디코딩함.                |
| HomeService | 홈 화면에서 사용할 [Product] 타입의 데이터를 가져옴. |



## * 사용한 라이브러리

### SnapKit, Then

* 코드로 UI를 구현할 때 효율적이며, 알아보기 보다 더 명확하도록 사용함.