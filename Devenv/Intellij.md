## Keyword
`intellij` `from_eclipse_to_intellij`

## Reference
- [jetbrains - Migrating From Eclipse to IntelliJ IDEA](https://www.jetbrains.com/help/idea/eclipse.html)
- [SLiPP wiki - IntelliJ IDEA](https://www.slipp.net/wiki/display/IDE/IntelliJ+IDEA)

## 상황/ 궁금증
- Intellij가 그렇게 좋다는 소문을 들었다. 시퀀스 다이어그램이 자동 생성(기본 플러그인이었음 심지어)되는걸 경험하고, 귀찮아도 학습비용이 높아도 장기적으로 볼때 유용하겠다는 확신이 들어 eclipse에서 옮기기로 결정. 
  - 게다가 최근 eclipse 무거워서 쓸 수 없는 지경에 이르렀다. 프로그램을 켜는데도, 저장하는데도 오래걸린다. (coding convention이나 test에 관심이 가서 code quality check tool, UML, PMD 등 여러 plugin을 설치하고 설정을 여러개 해두었더니 메모리를 늘려놔도 견뎌내지 못한다 + 관리하는 프로젝트가 늘었음)

## 정리
### Plugin
- key proto X : 단축키 대신 마우스를 사용하면 해당 기능의 단축키 안내해주는 알림창이 뜸

### error 잡기
- Spring project 에서 dispatcher servlet 제대로 인식하지 못함.
  - project 설정을 확인
  - bug ![bug](/image/IntellijSettingNoProjectSDK.png "bug 발생화면")
  - 원인- project setting 제대로 안되어있음 ![cause](/image/IntellijSettingDispatherNotFound.png "bug 원인")
