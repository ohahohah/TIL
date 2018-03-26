## Keyword
`java system properties`

## Reference
- [The Java™ Tutorials - System Properties](https://docs.oracle.com/javase/tutorial/essential/environment/sysprop.html)

## 상황 / 궁금증
- log4j properties의 Absolute Path를 Relative Path로 변경하면서 ,현재 project의 rootpath 를 기준으로 설정하고 싶었음. [apache log4j - SystemProperties](https://logging.apache.org/log4j/2.x/manual/configuration.html#SystemProperties)을 보면,  `All properties can be set using normal system property patterns`로 되어있음. Java의 System Properties의 `user.dir` 을 사용하여 수정함.

## 정리
