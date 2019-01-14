## 개요
- 쓸만한 코드 조각 모아둠
- Java의 경우 [codota](https://www.codota.com/)의 [chrome plugin](https://chrome.google.com/webstore/detail/codota-java-code-viewer-d/cnpdaoipdfbkpdbdpmceeejdaabiebcb) 를 사용해 저장함
  - codota 는 아래와 같은 소프트웨어임. [홈페이지 참고함](https://www.codota.com/faq)
  > Codota's AI learns from existing Java code to help you build software faster and smarter. Codota uses learned code models to suggest relevant code. These suggestions save you time searching for references, and help prevent errors.

- short if
```Java
    public int getForwardCoord(int randomVal) {
        return randomVal >=4? 1:0;
    }
```

- split
```Java
        String str1 = "phone;;name;id;pwd";
        String word1 = str1.split(";")[0]; //phone
        String word2 = str1.split(";")[1]; //공백 "" 출력
        String word3 = str1.split(";")[3]; //pwd
         
        String[] words1 = str1.split(";", 0); // {"phone","name","id","pwd"}
        String[] words2 = str1.split(";", 2); // {"phone","name","id;pwd"}
```