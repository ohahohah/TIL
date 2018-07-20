- BinarySearch
- ADT
- sorting
- Heap : 운영체제 메모리 구조에서 쓰임
- LinkedList
    + 연결개념

------
데이터 로드(load) - exe - input putput
변수는 그릇
그릇의 모양 - 자료구조
적절한 그릇타입을 찾는일 - 접시에 물담아 마시면 화남(두루미 모습 - 여우 지금 니 나 멕이는거지?) -> 현실문제 - 검색어 치고 엔터딱 쳤는데 삼십분 후에 검색 결과 뜸( 아무도 그 서비스 사용안함)
-> 자료구조에 대한 이해

비에스티 - 어떤 모양의 그릇? 어떤 경우에 이 그릇을 써야할까? - 많이 쓰이는 곳

서치(탐색) - 이진탐색 - 이진탐색트리 - 힙 - 운영체제와 연관시켜서

이해하기 위해서는 펜이 필요 - 문제 가져오기

-----------
- 데이터의 특성 - divide N qun - 저장문제 정복
-- 어떤 종류의 데이터만 담고 있어. 여기랑 여기는 섞이지 않아.

- small size 로 줄여나감.  tree 구조에서도 재귀 많이 사용함
- LinkedList 와 연관 
  - 값 저장 + 다음 노드 무엇인지 저장
  - level 에 따른 node 수 : 2^0 2^1 2^2
    - 어떤 next로 가야할까? -  tree 의 관리기법

### 용어 정리 - Terminologies of tree structure
- 발표용 : 예제로 문제내기 / 모양에 맞게
- 기본 용어 : root, edge, node 
- 'root 에 대한 정보'
- 관계: Parents - Child / siblings / Descendants of A(올라가다보면 만남), Ancestors of E = A,B
- 위치에 따라 : Leaves[Terminal Nodes] , Internal Nodes
**중요**
- Path to E Root에서 특정 노드(E)까지 최단거리
  - Depth and level of B = 1 (Root에서 B까지 Path의 길이)
- Height of Tree = 2 = Leaf까지의 path
- Degree of B = 4 = B 가 가지는 childe의 수
- tree size = node 의 갯수 

- 모양에 따라
- Full tree 
  - 꽉 찬 삼각형! 
  - Leaf 꽉 차있음
- complete tree 
  - 바로 직전 depth까지는 Full tree 
  - Filled from left 왼쪽에서 오른쪽으로 채워나가는 과정이면 complete tree 

### 수식적인 특성 Characteristics of Tree
- 발표용 : pass. 이거 왜 필요하죠?
- edge갯수는 node 의 갯수만큼? -> reference 되는 node 갯수만큼 -> Root는 reference 안되는 node => num of nodes -1
- Depth of root = 0 
- Height of root = height of tree
- Maximum num of nodes at level i with degree d = d^i 
- Maximum num of leaves with height h and degree d = d^h
- Maximum size of a tree with height h and degree d = 1 + d + d^2+...+d^h = (d^h+1 - 1)/d-1
- Height of a complete tree with size s and degree d
h = r log d s(d-1)+1 ㄱ - 1
```
s = (d^(h+1) -1) / (d-1)
s(d-1) = d^(h+1)
s(d-1) + 1 = d^(h+1)
log d (s(d-1)+1) = h + 1
h = r log d s(d-1)+1 ㄱ - 1 #올림
```
s = 16 , d= 4 then h = 2

### Binary Search Tree and Implementation
**How to perform a faster search? 빠른 검색!**
- Implementation of tree node : 05:13
- Root 에 대한 reference만 저장해 놓음
- tree는 root에 대한 access만 가짐

### Insert and Search Operation of Binary Search Tree
- 우리가 지켜야할 규칙 : parent 보다 작은 값은 왼쪽 node로 큰 값은 오른쪽 node로 insert 한다
- recursion

-----------------
### BST - 외부 자료
이진 탐색 트리에서는 자료를 보관할 때 부모보다 작은 값을 갖는 자료는 부모의 왼쪽 서브 트리에 매달고 큰 값을 갖는 자료는 부모의 오른쪽 서브 트리에 매다는 이진 트리입니다. 그리고 이진 탐색 트리에서는 같은 값을 갖는 자료는 보관하지 않습니다. 이처럼 매달면 서브 트리도 이진 탐색 트리인 특징을 갖습니다.

### 이진 탐색
http://ehpub.co.kr/6-3-이진-탐색binary-search/

### 트리란?
http://ehpub.co.kr/7-이진-탐색-트리/

### 재귀적인 방식으로
http://ehpub.co.kr/7-2-이진-탐색-트리binary-search-tree-개요/

이진 탐색 트리에서는 자료를 추가할 때 재귀적인 방법으로 부모 노드를 찾을 수 있습니다. 그리고 검색할 때나 삭제할 때도 원하는 자료를 보관한 노드를 재귀적인 방법으로 찾을 수 있습니다.

다음은 자료를 추가할 때 부모 노드를 찾거나 검색 및 삭제할 때 원하는 자료를 보관한 노드를 찾는 알고리즘입니다. 물론 검색과 삭제에서는 반환한 노드의 값이 원하는 자료인지 확인은 해야겠죠.

검색 (key:키, sroot: 서브 트리의 루트노드)

    조건(sroot가 존재하지 않으면)

        0 반환

    rkey:= sroot.key

    gap: = rkey – key

    조건(gap IsEqual 0)

        sroot 반환

    조건(gap < 0)

        조건(sroot의 오른쪽 노드가 있다면)

            검색(key, sroot의 오른쪽 노드)

        sroot 반환

    조건(gap>0)

        조건(sroot의 왼쪽 노드가 있다면)

            검색(key, sroot의 왼쪽 노드)

        sroot 반환

이처럼 검색하면 높이가 h인 트리에서 각 계층(레벨, Level)마다 하나의 노드와 비교합니다. 따라서 이진 탐색 트리에서 검색 비용은 높이와 비례합니다.

만약 이진 탐색 트리의 각 계층의 노드가 꽉 차면 노드의 개수의 합은 2의 h승 -1개 입니다.

S(h) = 2^0 + 2^1 + 2^2 + … + 2^(h-1) =2^h – 1

따라서 검색 비용은 노드의 개수가 n일 때 h 번이므로 h = logn이며 Θ(logn)이라 말할 수 있습니다. 하지만 편향 트리에서는 O(n)일 수 있습니다.

### 삽입, 삭제 , 검색 눈으로 보기
https://www.cs.usfca.edu/~galles/visualization/BST.html

### Algorithm complexities
- http://bigocheatsheet.com






