## Keyword
`oop` `polymorphism`

## Reference
- [opentutorials - Java 다형성](https://opentutorials.org/module/516/6127)

## 정리
### 다형성(Polymorphism)이란?
> 하나의 메소드 또는 클래스가 다양한 방법으로 동작하는 것 
> ([opentutorials - Java 다형성](https://opentutorials.org/module/516/6127))

### 먼저 이해해야할 것
- interface -  특정한 인터페이스를 구현하고 있는 클래스가 있을 때 이 클래스의 데이터 타입으로 인터페이스를 지정 할 수 있음
```java
package org.opentutorials.javatutorials.polymorphism;
interface I{}
class C implements I{}
public class PolymorphismDemo2 {
    public static void main(String[] args) {
        I obj = new C();
    }
}
```

- 상속 : 하위 클래스를 상위 클래스의 데이터 타입으로 인스턴스화 했을 때 어떤 일이 일어나는지


### 오늘의 코드
```java

```