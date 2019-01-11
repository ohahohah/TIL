## 풀어야할 질문들을 적음

### TDD
- 테스트케이스 명세는 곧 기능명세가 되는 경우가 많음. 그럼 다음 테스트케이스는 합치지 말아야할까? 전진조건값에 따라 전진값이 맞게 주어지는지 확인` 보다 아래 두개의 메소드로 나누는게 명확해보인다.
```
 @Test
    public void 전진조건값이_4이상일때_전진값이_맞게_주어지는지_확인() {
        int randomNum  = 4;
        int expectedGoCarVal = 1;

        RaceCar rc = new RaceCar();

        assertEquals(expectedGoCarVal,rc.getForwardCoord(randomNum));

    }

    @Test
    public void 전진조건값이_4미만일때_전진값이_맞게_주어지는지_확인() {
        int randomNum  = 3;
        int expectedGoCarVal = 0;

        RaceCar rc = new RaceCar();

        assertEquals(expectedGoCarVal,rc.getForwardCoord(randomNum));

    }
```

- Unit Test에서 GWT(Give-When-Then) 장단점?
  - TDD 실천법과 도구 라는 책으로 알려져있는 채수원 개발자의 예전 블로그를 보다가 이 글을 발견
http://blog.doortts.com/169 여기서 'Given - When - Then(GWT)' 이라는 걸 발견했는데요.
궁금해서 더 서핑하다가 이 두가지 article을 발견
https://www.slipp.net/questions/82#answer-488
https://martinfowler.com/bliki/GivenWhenThen.html
  - 지금 내가 짜는 테스트케이스들이 명시적으로 `give`등의 구문이 써있지만 않을 뿐이지 이런 구조로 되어있는 것 같음. 이 구조를 사용하지 않은 테스트케이스가 뭐가 있지? 그동안 당연히 이 구조가 테스트케이스를 정의하는 방법이라고 생각했는데 음... 단점이 뭔지 이해가 잘 안됨.
    - 어떤 객체를 생성하고 - Given / 어떤 상황에서 - When / 이런 값이 나올꺼야 - Then 하는걸 GWT라고 생각했음



