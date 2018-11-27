## 참고
- [알고리즘 강의 - 권오흠 교수님](https://www.inflearn.com/course/알고리즘-강좌/)
- 책 컴퓨터과학이 여는 세계 - 이광근

## 정리
- Richard Bellman이 만듦. 대표적인 두가지 유형으로 Dynamic Prgramming을 살펴보자(피보나치 수열, 이항계수)
- 문제를 순환함수로 정의하여 순환식을 사용하여 문제를 풀어나감.
- top-down방식의 Memoization과 bottom-up방식의 Dynamic programming 이 있음
  - Memoization
    - 중간 계산 결과를 caching(배열 cache에 저장)해서 중복계산을 피함
    - pros. 실제로 필요한 subproblem만 사용함. 
    - cons. recursion 을 사용하기 때문에 overhead가 발생할 수 있음 
  - Dynamic programming(bottom-up)
    - **배열을 이용해서 순환식의 가장 단순한 항부터 계산하는 테크닉**. bottom-up은 기본 bottom에서 시작해서 내가 원하는 값을 구하는 것이므로, 어디가 'bottom'인지 즉, 계산을 어느 방향에서부터 시작하는지 정의해야함
    - pros. recursion 을 사용하지 않아서 overhead가 발생하지 않음
    - cons. 실제로 필요한 값외에 subproblem만 사용함. 

### 피보나치 수열
- 순환식으로 정의되기때문에 Recursion 으로도 구현
- But 많은 계산이 중복됨 == 비효율적 
  - e.g fib(7) = fib(6) + fib(5) = (fib(5) + fib(4)) + (fib(4)+fib(3)) = ...
#### **Memoization** 사용
- 이미 계산된 fib(n)	값이 있다면, 그 값을 쓰자! 중간 계산 결과를 caching(배열 cache에 저장)해서 중복계산을 피함
- **계산값을 저장할 배열(cache라 부름)에 값을 저장 caching**  

```java
int fib(int n){
  If(n == 1 || n ==2)
	return 1l
  else if (f[n] > -1) // 배열 f가 -1로 초기화되어있다고 가정
	return f(n)l
  else{
	f[n] = fib(n-2) + fib(n-1); // 중간 계산결과를 caching
  }
}
```
	
#### Bottom-up 방식
- 우리가 f(10) 을 계산하려고 할때, 차례대로 1,1,2,3,5,8,13,21,34,55,... 이렇게 계산할 것이다. 
- f(8)을 계산하려는 시점에 이미 f(6)과 f[7] 의 값을 이미 가지고 있음
- **배열을 이용해서 순환식의 가장 단순한 항부터 계산하는 테크닉**
  
```java
int fib(int n){
  f[1] = f[2] = 1;
  for (int i = 3; i <=n; i++){
  	f[n] = f[n-1] + f[n-2];
  return f[n]; 
  }
}	
```  

### 이항계수(Binomial Coefficient) nCk (n >= k)
- 이항계수 정의 : n 개 중 k를 선택하는 경우의 수
<img src = "https://github.com/ohahohah/TIL/blob/master/Image/binomial.JPG" width="400px;"/>  

- 계산: nCk = (n!) / {(n-k)!k!} , 많은 계산이 중복됨. 또한 계산하면 매우 큰 수임. Overflow 발생하기 쉬움. 100! 계산을 생각하면 int형으로는 힘듦  

- 접근 : n개 중에 k개를 고를 경우의 수 = 특정 원소 a를 골랐을때 경우의 수 + 특정원소 a를 고르지 않았을 때 경우의 수 = 특정원소 a를 제외한 n-1개에서 k-1 개를 고를 경우의 수(이미 특정원소 a는 모든 경우에 항상 들어가므로, a를 제외한 전체 n-1개에서 a를 제외한 k-1 개를 고르는 경우의 수) + 특정원소 a를 제외한 n-1개에서 k 개를 고를 경우의 수 (특정원소 a는 항상 포함되지 않으므로, 전체 수가 a를 제외한 n-1개가 되고, 그 중에서 k개를 골라야함)= n-1Ck-1 + n-1Ck

```java
int binomial (int n, int k){
  if(n == k || k == 0 ) // base case
	return 1;
  else // general case
	return binomial(n-1,k) + binomial(n-1, k-1); // recursion 하다보면 , 첫 항은 n = k , 두번째 항은 k=0 에 도달하게 됨.
} 
```   

- 잠깐! Recursion 설계 체크 
	- base case
	- recursion case(general case)
	- **중요조건** : recursion이 무한루프에 빠지지 않으려면, general case 를 recursion 하다보면 base case에 도달해야함.   

#### Memoization
- n,k 두 가지 값으로 정의되기때문에 cache가 2차원 배열. n >=k 이므로 2차원 배열 절반만 사용 
<img src = "https://github.com/ohahohah/TIL/blob/master/Image/binomial_array.JPG" width="400px;"/>  

```java
int binomial (int n, int k){
  if(n == k || k ==0){
	return 1;
  }else if (binom[n][k] > -1){   // 배열 binom 이 -1로 초기화되어 있다고 가정
	return binom[n][k];
  }else {
	binom[n][k] = bonomial(n-1,k) + binomial(n-1,k-1);
	return binom[n][k];
  }
}
```

#### Bottom-up
```java
int binomial(int n , int k){
  for(int i =0 ; i <= n; i++){
	for(int j = 0; j <=k && j<=i; i++){
		if (k==0 || n == k){
			binom[i][j] = 1;
		}else {
			binom[i][j] = binom[i-1][j-1] + binom[i-1][j];
		}
	}
  }
}
```
-  피보나치 수열(1차원 배열 cache사용)과 다르게 2차원 배열을 cache로 사용하고 있으므로 어디가 'bottom'인지 즉, 계산을 어느 방향에서부터 시작하는지 정의해야함
	- **bottom-up은 기본 bottom에서 시작해서 내가 원하는 값을 구한다.**
	-  순환식에서 오른쪽 항(binom[i-1][j-1] + binom[i-1][j])에서부터 왼쪽 항(binom[i][j] )을 구한다는 의미. 그러려면 오른쪽 항의 값이 미리 계산되어야함.
	- 이 경우에는 위 그림의 dependency 같이 대각선 방향에 대한 값(binom[i-1][j-1] ), 바로 위 행에 대한 값(binom[i][j])을 알아야함. 
	- 만약 행 우선순위로 테이블 값을 계산한다면, 계산해야할 값의 윗 행의 값이 이미 구해져있으므로 bottom-up이 가능
- check! 두번째 순환문 `for(int j = 0; j <=k && j<=i; i++)`
  - `j <= i` :  nCk 는 언제나 k<=n 이므로
  - `j <= k` : k까지의 계산값만 필요하고, 그 이후 값은 필요하지 않으므로 (대각선 아래 부분의 배열값만 계산하면 됨) 

