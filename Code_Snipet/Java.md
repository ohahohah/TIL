## 개요
- 쓸만한 코드 조각 모아둠
- Java의 경우 [codota](https://www.codota.com/)의 [chrome plugin](https://chrome.google.com/webstore/detail/codota-java-code-viewer-d/cnpdaoipdfbkpdbdpmceeejdaabiebcb) 를 사용해 저장함
  - codota 는 아래와 같은 소프트웨어임. [홈페이지 참고함](https://www.codota.com/faq)
  > Codota's AI learns from existing Java code to help you build software faster and smarter. Codota uses learned code models to suggest relevant code. These suggestions save you time searching for references, and help prevent errors.

- short if
```Java
    public int getForwardCoord(int randomVal) {
        return randomVal >= 4 ? 1 : 0;
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

- List - initialze
```Java
// JDK 7
List<String> list = new ArrayList<>();
list.add("one");
list.add("two");
list.add("three");

//JDK 8
List<String> list = Stream.of("one", "two", "three").collect(Collectors.toList());

// JDK 9
List<String> list = List.of("one", "two", "three");
```

- List - print element
```Java
// JDK 8 
list.forEach(System.out::println);
//with comma
String.join(",", list)
list.stream().collect(Collectors.joining(","))
//change Upper-case with Comma
list.stream().map(String::toUpperCase).collect(Collectors.joining(","));

// JDK 7
System.out.println(Arrays.toString(list.toArray()));
```

- List - clear() vs removeAll() vs new ArrayList()
  - [How to empty or clear ArrayList in Java](https://howtodoinjava.com/java/collections/arraylist/empty-clear-arraylist/)
  - [(list.clear() vs list = new ArrayList<Integer>();](https://stackoverflow.com/questions/6961356/list-clear-vs-list-new-arraylistinteger)
  - [Empty an ArrayList or just create a new one and let the old one be garbage collected?](https://stackoverflow.com/questions/18370780/empty-an-arraylist-or-just-create-a-new-one-and-let-the-old-one-be-garbage-colle)
  - [Better practice to re-instantiate a List or invoke clear()
](https://stackoverflow.com/questions/3823398/better-practice-to-re-instantiate-a-list-or-invoke-clear)
  > The main thing to be concerned about is what other code might have a reference to the list. If the existing list is visible elsewhere, do you want that code to see a cleared list, or keep the existing one?
  > 
  > If nothing else can see the list, I'd probably just clear it - but not for performance reasons; just because the way you've described the operation sounds more like clearing than "create a new list".

- print
  - [How do you create a new line in Java programming?](https://www.quora.com/How-do-you-create-a-new-line-in-Java-programming)
  1. System.out.println(); [takes care of the newline implicitly]
  2. Using a combination of escape sequences:
    2.1. System.out.print("\n");
    2.2. System.out.print("\n\r");
  3. Using System defined methods/ key- value pairs:
    3.1. System.out.print(System.lineSeparator());
    3.2. System.out.print(System.getProperty("line.separator"));
