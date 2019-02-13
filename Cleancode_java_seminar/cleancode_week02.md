
## 클린코드
[해당 주차 강의자료](https://nextstep.camp/courses/-KxqIISQT-160AGeJrJ_/-KxqJ2TybscFTI2BVjbn/lessons/-L8zUTqmyZy7HUgGYMTC)
- 나쁜 코드를 나중에 고쳐야지 -> 나중은 절대 오지 않는다. - 르블랑의 법칙
- 원대한 재설계의 꿈 - 레거시코드를 엎고 새로운 프로젝트를 만든다? 이제 힘든 프로젝트가 두 개가 되겠져... -> 재설계가 아닌 꾸준한 리팩토링
- 빨리 가는 유일한 방법은 **언제나 코드를 최대한 깨끗하게 유지하는 습관이다.**
- 무리한 요구는 용기있게 거절하자. 거절하려면 실력 YO

## 피드백
- static final 둘 다 써야해요 -> 많아지면 enum
- 글쓰기처럼 문맥에 흐름에 맞게 적절한 공백라인과 space를 고려해라.
- 팀 내에서 컨벤션 맞추기 - 거슬리고, 시간쏟고 그러지말고 통일합시다
- 내 자식의 이름을 짓는 마음으로 이름짓기 - 주석보다 이름 잘 짓는 것에 시간을 쏟아라
  - 자료구조를 이름에 넣는 것 비추
  - list, str 등의 자료형을 이름에 넣지 마라. java는 추적이 가능함. 
  - 애매한 숫자도 쓰지 마라 - i1,i2,... 
  - 변수의 역할을 드러내라
- 애매한 getter,setter 는 로직 
  - 객체의 상태와 행위
  - 객체의 데이터를 꺼내지말고 해당 객체에 메시지를 보내서 행위를 변경하게 하라
  - 나중에 중복로직이 일어남 

코딩컨벤션은 따라가고, 더 중요한 걸 끊임없이 설득해라
- 치명적인게 아니잖아여
- 테스트코드, 리팩토링 
- me: 위키

## Car Random 레거시일때
- method인자 바꿀 수 없는 경우, 메소드를 분리해서 테스트함
- 테스트를 위해 새로운 클래스를 만듦 - 파일이 아니라 익명클래서
- 테스트를 하다보면 익명클래스를 많이 쓰게됨
  - 익명클래스를 적극 이용하자
  
## Car move
- Step01. 테스트 가능한 코드와 테스트하기 힘든 부분을 분리
- Step02.interface 추출

- 인스턴스 변수를 최소화해라
  - 많으면 중복이 많아진다
  - 여러 곳에서 싱크를 맞추기 어려워진다

- Dto 역할 구분 : CarDto - data를 언제든지 꺼내올 수 있는 것 
/ valueObject 가 아님 - 값이 고정되어있는 것임.

- 유효성 체크
  - 도메인 로직에서 체크를 할때의 장점
- 코드가 복잡하면, java API를 사용할 생각을 해봐라
  - java string join : 우승자 문자열 출력

## MVC
- MVC로 나눠라 
- domain이 핵심로직이 들어있음. MVC 를 잘 분리할수록 테스트하기 쉬워진다

- 인스턴스 변수와 클래스 메소드가 헷갈릴때 어떻게?
  - 종속적이지 않으면 클래스 메소드로 
- 원칙적으로 테스트케이스에는 하나의 테스트만 나와야한다. 가능한 하나만 쓰기. 여러개면 테스트케이스가 너무 크지 않은지 의심해봐라
- 로직을 담당하는 곳에는 setter()를 쓰지마! dto에서 쓰는거다

- 힌트. 테스트가능하다면 그만큼 유연한 코드라는 거다
----------
- 연습할때는 확실히 극단적으로!

## Week02 
### 먼저, [TDD, 리팩토링이란?](https://nextstep.camp/courses/-KxqIISQT-160AGeJrJ_/-KxqJLtO3k1rvq5Fuz_J/lessons/-KxqNu6BSR_VAUsd6N9k)
- 목표: 객체를 작은 단위로 쪼개는 연습
- 규칙 8: 일급 콜렉션을 쓴다.
  - 일급콜렉션? Cars { List<Car> cars; }
- TDD = TFD(Test First Development) + 리팩토링 
  - 리팩토링을 잊지 맙시다! - 점진적 설계 & 구현
  - 요구사항 분석과 단위를 잘 나눠야함다

### TDD로 자동차 경주게임 구현
- [TDD로 자동차 경주게임 구현](https://nextstep.camp/courses/-KxqIISQT-160AGeJrJ_/-KxqJLtO3k1rvq5Fuz_J/lessons/-L9D5L4Xj_6xjTfOTRks)
- 대략적인 도메인 객체 설계!
  - 그동안 요구사항을 잘게 쪼개고, 테스트 목록을 적고 나서 하다보면 막막
  - 이 단계가 빠져있었넹
- 도메인지식이 없다면,(도메인에 익숙하지 않을땐) Out -> In 방식으로 접근
  - 초보일때 첫 접근방식으로 좋음
  - 나중에 익숙해지면 In -> Out방식일때 더 쉬울 수 있음. 깔끔한 테스트코드로 시작.
- 리팩토링 믿고 일단 가즈아

#### 라이브코딩
- 제일 먼저, **행위에 집중** - 이 메소드의 input과 output이 무엇인지를 판단하자- 
  - 최대한 단순하게 - 5회 이동횟수 빼고 그냥  b("car01,car02")
  - UI에 종속적이지 않은 값으로 - output으로 구현하면 되니까여
- 테스트가 가능한가 의 관점으로 바라봅시다
- 디펜던시 끊기 -> 인터페이스 

```
//interface MoveStratgey 
@Test
가는 함수(){
rg.move("car01,car02",
new MoveStratgey(){
    @Override
    public boolean canMove(){
        return true
    }
}
);
}

//요걸 람다로
car.move(() -> true)
``` 
- 클래스 메소드로 구현하다보면, input, output이 자연스럽게 쪼개진다

- 생성자 활용
```
RacingGame(){

List<Car> cars; 

RacingGame(String carNames){
    String[] cars = carNames.split(",");
    creteCars(cars);
}

}
```
- 클래스 메소드로 변환하려는 노력
```
List<Car> findWinner02 (List<Car>){

}
//위에 꺼 파라미터있어서 마음에 안들면 아래처럼 날로 먹어도 됨
List<Car> findWinner01 (){
    return findWinner02(this.cars)
}
```

- 함수형 스타일로 했을때 테스트하기 쉬운 구조가 만들어짐
- 개인적으로는 private 테스트가 안되니, package 접근하게 함
  - 또는 utils클래스로 분리해서 public 하게 함

- 연습할떄 스텝바이스텝으로 차근차근
- 테스트코드 자체도 리팩토링
- 추상화 레벨을 맞추기 - composit pattern
  - split 도 따로 메소드로 나누네 
- 일단 구현하고 메소드를 추출해보세여 (예측하면서 하면 다른 고민이 깊어져여)

------
# 실습
- 그렇게 많이 썼던 string matcher가 생각이 안났음;;;
- 정규표현식 또 까먹
- TDD로 시작했는데 구현하다보면 습관대로 로직만 구현하고 나중에 테스트케이스 만듦.
  - 대신 작게 작게 바로 확인하기는 하지만, TDD 책에 나온대로 testFailed -> 빨리 테스트 통과 -> 리팩토링 의 단계로 가지않는다.
- input.contains(문자열) 과 match(정규표현식):완전히 매치되어야함. 차이!

```
  static String getPlainInput(String input) {
//    if(!input.matches("^//(.*)\n")){
//      return input;
//    }

    Matcher m = Pattern.compile("//(.*)\n(.*)").matcher(input);
    while(m.find()){
       return m.group(2);
    }
    return null;
  }
```
주석처리부분 있을때 - 구분자정의 구문이 출력이 안됨와 없을때의 차이

- 테스트케이스 깨지는거 무시하지 말자! 나중에 더 꼬여서 안보인다.
- 테스트케이스가 큰게 깨지니까 디버깅이 안된다. 작은 테스트케이스 깨지는지 보면서 디버깅 해보기

## 질문
- 인터페이스 언제 만드는게 나을까? 
-split 인터페이스도 나누는게 맞았을까? 
```
//TODO interface??
//  private String[] split(String text, String customDelim) {
////    return text.split(customDelim);
////    TODO customDelim만 하도록 수정
//    String validateDelim = validateDelim(text,customDelim);
//
//    return text.split(DEFAULT_DELIMITER_REGEX + "|" +validateDelim);
//  }
```

예외처리 단위 - 기본예외 / 세부예외 - 구분자 예외 생성시 다른 음수 등도 레벨이 같게 커스텀익셉션으로 맞춰줘야하는지?익셉션 정의는 팀미다 다른건지

Parser parser = new Parser();
-> 클래스변수 - 정적이면 메모리에 많이 올라가잖아. 그래서 생성했는데 저러면 안되나.
util은 static으로 하고 해당 클래스에만 사용하는 건 이렇게 하는데 맞아?

"나는문자열"

 /*
## 프로그래밍 요구사항
indent(들여쓰기) depth를 2단계에서 1단계로 줄여라.
depth의 경우 if문을 사용하는 경우 1단계의 depth가 증가한다. if문 안에 while문을 사용한다면 depth가 2단계가 된다.
메소드의 크기가 최대 10라인을 넘지 않도록 구현한다.
method가 한 가지 일만 하도록 최대한 작게 만들어라.
else를 사용하지 마라.

  ## 요구사항
- 쉼표(,) 또는 콜론(:)을 구분자로 가지는 문자열을 전달하는 경우 구분자를 기준으로 분리한 각 숫자의 합을 반환 (예: “” => 0, "1,2" => 3, "1,2,3" => 6, “1,2:3” => 6)
- 앞의 기본 구분자(쉼표, 콜론)외에 커스텀 구분자를 지정할 수 있다. 커스텀 구분자는 문자열 앞부분의 “//”와 “\n” 사이에 위치하는 문자를 커스텀 구분자로 사용한다.
  - 예를 들어 “//;\n1;2;3”과 같이 값을 입력할 경우 커스텀 구분자는 세미콜론(;)이며, 결과 값은 6이 반환되어야 한다.
- 문자열 계산기에 숫자 이외의 값 또는 음수를 전달하는 경우 RuntimeException 예외를 throw한다.

## 세부 요구사항
### view
- 문자열을 입력받음

### 도메인 로직
- [기능]입력받은 문자열을 파싱하여 덧셈
  - 문자열 파싱
  - 덧셈

- 입력문자열은 쉼표(,) 또는 콜론(:)을 구분자로 가짐
- 입력문자열은 커스텀 구분자를 가짐 (커스텀 구분자는 문자열 앞부분의 “//”와 “\n” 사이에 위치하는 문자를 커스텀 구분자로 사용)
- 숫자 이외의 값 또는 음수를 전달하는 경우 RuntimeException 예외를 throw

#### 확인 목록
- 정수형만 덧셈하니?

## 테스트 목록
- [x] 문자열 입력했을때 쉼표 구분자로 구분하여 리턴하는지 확인
- [x] 문자열 입력했을때 콜론 구분자로 구분하여 리턴하는지 확인
- [x] 문자열 입력했을때 커스텀 구분자로 구분하여 리턴하는지 확인

- [x] 숫자 이외의 값을 전달하면 RuntimeException 예외를 throw
- [x] 음수를 전달하는 경우 RuntimeException 예외를 throw
- [x] 빈 문자열일 경우 IllegalArgumentException를 던지는지 확인

- 문자열을 숫자로 변환하는지 확인

- 덧셈을 하는지 확인
  * */

  /*
요구사항 1 - primitive type을 사용하지 마라
int와 같은 primitive type을 직접 사용하지 말고 자바 객체를 생성해 구현해 본다.
힌트 - int number와 같은 부분을 Positive와 같은 객체를 추가해 구현해 보고 이전 구현 방식과 비교해 본다.
-> 리턴 타입이 달라져도 다 고칠 필요없음 -> 객체의 속성이 달라질때 고치기 편함 / 어떤 타입으로 넘겨도 객체 안에서 자기 관련된건 처리해줌 (String 으로 넘기던 int로 넘기던)
-> void는 여러 메소드랑 같이 쓰기 뭔가 불편하다
-> 생성자 사용하면 뭔가 사전에 해줘야하는 로직들을 줄여준다 -> 이게 캡슐화가 더 잘되는거야??

요구사항 2 - 문자열 split 규칙을 확장 가능하도록 구현한다.
문자열을 split하는 규칙이 현재는 기본 구분자와 custom 구분자 두 가지가 있다. 앞으로 문자열을 split하는 규칙이 계속해서 추가될 것으로 예상한다. 규칙이 추가되더라도 영향을 최소화하면서 확장 가능하도록 구현한다.
힌트 - 문자열을 split 규칙을 대표하는 interface를 생성하고, 각 규칙에 따른 구현체를 구현한다.

요구사항 3 - java 8의 람다를 활용해 구현한다.
java 8에 추가된 람다를 활용해 위 요구사항을 구현해 본다.
-> 뭔가 체인해서 쓸 수 있다. 책에서 읽은 내용으로는 모듈화가 깔끔해진다고 한다.

이너클래스가 더럽게 안된다.
 */
return validateLottoNums(inputs.stream().map(i -> String.valueOf(i)).toArray(String[]::new));
