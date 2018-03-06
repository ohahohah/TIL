## Keyword
`intellij` `from_eclipse_to_intellij`

## Reference
- [jetbrains - Migrating From Eclipse to IntelliJ IDEA](https://www.jetbrains.com/help/idea/eclipse.html)
- [SLiPP wiki - IntelliJ IDEA](https://www.slipp.net/wiki/display/IDE/IntelliJ+IDEA)
- [jojoldu - IntelliJ 디버깅 해보기](http://jojoldu.tistory.com/149?category=678716)

## 상황/ 궁금증
- 2018/03/06 
  - 개인프로젝트, 회사프로젝트 모두 Intellij 로 옮겼다.
  - 아직 완전히 단축키가 손에 익지 않았다. 'key promoto' plugin과 출력한 keymap reference 도움을 많이 받고 있다. 
  - 다음 목표는 내장기능에 익숙해지는 것! sequence Diagram 을 자체 기능으로 내장되어있어서 매우 인상깊었음. 
  - Intellij가 코딩 다해준다는 우스개소리를 들었었던 적이 있는데 Inspection 과 자동완성 기능을 사용하면 가능할지도 모른다! 두 기능 매우 놀랍다.
- 2018/01/25 Intellij가 그렇게 좋다는 소문을 들었다. 시퀀스 다이어그램이 자동 생성(기본 플러그인이었음 심지어)되는걸 경험하고, 귀찮아도 학습비용이 높아도 장기적으로 볼때 유용하겠다는 확신이 들어 eclipse에서 옮기기로 결정. 
  - 게다가 최근 eclipse 무거워서 쓸 수 없는 지경에 이르렀다. 프로그램을 켜는데도, 저장하는데도 오래걸린다. (coding convention이나 test에 관심이 가서 code quality check tool, UML, PMD 등 여러 plugin을 설치하고 설정을 여러개 해두었더니 메모리를 늘려놔도 견뎌내지 못한다 + 관리하는 프로젝트가 늘었음)



## 정리
### Intellij 에 익숙해지기
- 방식에 익숙해지기
  - [IntelliJ IDEA 기반 IDE의 Tips & Tricks by Hadi Hariri :+tv:](https://youtu.be/haEvl7ZV5sU)
  - [Help(idea 2017.3) - Migrating From Eclipse to IntelliJ IDEA](https://www.jetbrains.com/help/idea/2017.3/eclipse.html?utm_campaign=IU&utm_content=2017.3&utm_medium=help_link&utm_source=from_product)
- 단축키에 익숙해지기
  - Intellij menu의 Help -keymap reference / key proto X Plugin 설치
- 맨 처음 시작할때 기본 설정
  - File encoding 설정(Global encoding & Project encoding = UTF-8) / 참고 : [[IntelliJ] 기본설정(font, theme, encoding, keymap), Plugin설치, Library 추가 방법](http://blog.woniper.net/184?category=537962)
  - 코드 창 줄수 보이기 : Settings/Preferences | Editor | General | Appearance | Show line numbers 

### Plugin
- key proto X : 단축키 대신 마우스를 사용하면 해당 기능의 단축키 안내해주는 알림창이 뜸

### error 잡기
- Spring project 에서 dispatcher servlet 제대로 인식하지 못함.
  - project 설정을 확인
  - bug ![bug](/Image/IntellijSettingNoProjectSDK.png "bug 발생화면")
  - 원인- project setting 제대로 안되어있음 ![cause](/Image/IntellijSettingDispatherNotFound.png "bug 원인")
