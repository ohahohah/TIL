
## 이전시간
Notimanager  : SNS noti 같은거임


## ST-3
"SPAM"이 들어간 제목인 경우 Todo가 생성되서는 안된다. : 무시함. 예외도 안던짐.
Jira에서 호출된 Todo의 경우 noti하지 말아달라. : title이 "[JIRA]" 로 시작함
그런데 Jira에서 호출되더라도 급한건 noti해 달라 : 급한 건 -> title 안에 'URGENT'가 들어가면 (대문자일 경우만)

## ST-4
 테스트케이스를 건드리지않고, 버그픽스를 테스트케이스를 가지고 함. 버그가 있을경우, fail 되는 케이스를 만들어야함. 버그재현을 테스트케이스로 함. 버그를 고치면 테스트케이스 통과하겠죠.
------
ST-2    create 성공 후 NotiManager 호출  create(Todo) 성공 후 NotiManager.notify(title)을 호출 

파일
src/main/java/net/slipp/todo_list
NotiManager.java
TodoManager.java
src/test/java/net/slipp/todo_list
TodoManagerTest.java

구현 내용
TodoManager_Create_정상_수행시_notify호출시_RuntimeException을_무시하는지_확인
TodoManager_Create_정상_수행_후_notify호출이_정상적으로_호출되는지_확인
TodoManager_Create_에서_Exception발생시_NotiManager_notify가_실행안되는지_확인

------
title에 "SPAM"이 들어가면,Todo가 생성되지 않는지 확인
title이 "[JIRA]" 로 시작하면_NotiManager_notify가_실행안되는지_확인
- 'JIRA' 일 경우 fail하는지 확인
- 
title이  "[JIRA]" 로 시작하고,'URGENT'단어가 있으면 notify호출이_정상적으로_호출되는지_확인
- 



