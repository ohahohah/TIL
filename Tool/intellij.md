## what
- 에러 상황들 기록

## 정리
- 파일 인코딩 문제 [Error:(1, 1) java: illegal character: '\ufeff'](http://blog.naver.com/PostView.nhn?blogId=zzisoo9&logNo=220394962141) : 파일을 다른 에디터로 오픈했을때 UTF-8을 제대로 못 읽어옴. 파일 앞에 보통 인코딩 정보가 있는데 그 정보가 제대로 읽어들이지 않음. 인코딩 깨짐 에러 나면 UTF-16 으로 바꾼 후 다시 UTF-8 로 바꾸면 해결