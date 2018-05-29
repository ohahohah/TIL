## Keyword
`aws` `aws tutorial`

## Reference
- [AWS 10분 자습서 (공식)](https://aws.amazon.com/ko/getting-started/tutorials/)
- [생활코딩 - aws 기초](https://www.inflearn.com/course/aws-%EC%95%84%EB%A7%88%EC%A1%B4-%EC%9B%B9%EC%84%9C%EB%B9%84%EC%8A%A4-%EA%B0%80%EC%9E%85%EB%B6%80%ED%84%B0-%ED%99%9C%EC%9A%A9%EA%B9%8C%EC%A7%80/)
- [SLiPP wiki - 2주차 - AWS 입문](https://www.slipp.net/wiki/pages/viewpage.action?pageId=26640617)
- [datum.io - AWS EC2에 R SERVER 설치하기(1)](http://datum.io/aws-ec2-rserver-installation1/)
- [hjpco - [AWS] R Studio Server 구축하기](https://hjpco.wordpress.com/2017/05/19/aws-r-studio-server-구축하기/)

## 궁금증 / TODO
- AWS에서 docker사용할때 이미지를 ec2에 저장하나? 저렴한 s3에 저장하고 끌어다쓰면 안되나? ECS는 배포가 아닌 그냥 사용할때도 적합한가? 프리티어로 사용할 수 있나?
- stopped 된 instance를 ssh로 접속하면 자동으로 running 상태로 바뀌나?
- ec2에 설치한 rstudio-server가 구동이 안된다. 프로세스는 실행되고 있다고 나오는데 왜지.
- pandas sprint 세팅 ec2에 올려서 할 수 있을까? 
- aws c9 지금 만든 ec2로 쓸 수 있나? 새로 instance 만들어야하나?

## 정리
### 개념
#### VPC란?
- [아마존 웹 서비스를 다루는 기술 20장 가상 네트워크를 제공하는 VPC](http://pyrasis.com/book/TheArtOfAmazonWebServices/Chapter20)
- [AWS 설명서 - Amazon VPC란 무엇인가?](https://docs.aws.amazon.com/ko_kr/AmazonVPC/latest/UserGuide/VPC_Introduction.html)
- [AWS 설명서 - Amazon Virtual Private Cloud - 시작 안내서 - 개요](https://docs.aws.amazon.com/ko_kr/AmazonVPC/latest/GettingStartedGuide/ExerciseOverview.html)

#### VPC SecurityGroup란?

#### EC2란?
- [AWS 설명서 - Amazon EC2란 무엇입니까?](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/concepts.html)
  > Amazon Elastic Compute Cloud(Amazon EC2)는 Amazon Web Services(AWS) 클라우드에서 확장식 컴퓨팅을 제공합니다. 
- EC2 Keypair란? 
 > Amazon EC2는 퍼블릭 키 암호화 기법을 사용하여 로그인 정보를 암호화 및 해독합니다. 공개 키 암호화 기법은 공개 키를 사용하여 암호 등의 데이터를 암호화하고, 수신자가 개인 키를 사용하여 해당 데이터를 해독하는 방식입니다. 퍼블릭 키와 프라이빗 키를 키 페어라고 합니다.
 > 인스턴스에 로그인하려면 키 페어를 만들고, 인스턴스를 시작할 때 키 페어의 이름을 지정하고, 인스턴스에 연결할 때 프라이빗 키를 제공해야 합니다. Linux 인스턴스에서 퍼블릭 키 내용은 ~/.ssh/authorized_keys 내 항목에 있습니다. 이 과정은 부팅 시에 처리되므로 암호 대신 프라이빗 키를 사용하여 안전하게 인스턴스에 액세스할 수 있습니다.
 > from. [aws 자습서](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

---------
### EC2 keypair 바꾸기
- EC2 인스턴스는 생성시에 keypair를 설정할 수 있으며, **그 이후에는 DashBoard에서 keypair를 변경할 수 없음**  
  - 주의: 내가 한 실수. EC2 DashBoard에서 Key Pairs 에서 키 생성하면 해당 인스턴스에 접속할 수 있는 줄 알았음.
- key를 변경 또는 추가하고 싶을 겅우, 기존의 keypair를 사용해 해당 인스턴스에 접속하여, key설정을 바꾸어야함.

#### EC2 keypair 확인
- 현재 해당 instance에 등록되어 있는 keypair 확인 
  - 인스턴스 **생성시** 설정해둔 publickey 확인 : EC2 접속 후, `curl http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key`
  - INSTANCES - Instances - 해당 instance 의 Description  gkdahrdml Key pair name 확인 : [주의] 인스턴스 메타데이터에 남아있는 정보를 가져오기때문에, EC2에 키를 업데이트하거나 추가했어도 해당 정보가 보이지 않을 수 있음
- 로컬에 있는 keypair 가 EC2에 등록된 keypair인지 확인 - key fingerprint 확인
  - 로컬 터미널에서 확인할 $path_to_private_key$(예. /User/mac/.ssh/seoul_MyService.pem) 커맨드 입력 : `openssl pkcs8 -in $path_to_private_key$ -inform PEM -outform DER -topk8 -nocrypt | openssl sha1 -c`
  - 출력되는 fingerprint와 EC2 dashboard의 NETWORK & SECURITY - Key pairs 에서 실제 Fingerprint 확인

#### EC2 keypair 생성
0. EC2 dashboard - NETWORK & SECURITY - Key pairs 에서 'Create Key Pair'로 새로운 keypair 생성 
  - 헷갈리지 않기 위해 KeyPair name 은 '리전_인스턴스명_(옵션)식별글자'규칙으로 생성하는 것이 편함
덧붙여줌 keyname 을 적어주는 것이 좋음 (예. seoul_MyService_user01)
1. 생성하면, 자동 다운로드되는 pem 키를 앞으로 사용할 디렉토리에 이동시킴
  - 해당 키는 다시 다운로드 할 수 없으니 관리에 주의하도록 함
  - 통상적으로 key는 ~/.ssh 아래에 둠 (예. ~/.ssh/seoul_MyService_user01.pem)
  - 해당 파일의 권한관리 설정함 `chmod 400 seoul_MyService_user01.pem` 또는 `chmod 600 seoul_MyService_user01.pem`
2. 다운받은 private Key의 publicKey를 확인하여 저장해둠.
  - Linux/ mac의 경우 아래와 같이 확인
    - 터미널에서 `ssh-keygen -y`  입력
    - 'Enter file in which the key is (/keypath/keyname 예시):'와 같거나 비슷한 의미의 문구가 출력되면 public key 경로를 지정 (예. ~/.ssh/seoul_MyService_user01.pem)
    - 반환되는 publicKey를 복사해둠
  - Windows의 경우, PuTTYgen 등을 사용하여 가져옴. 
    - PuTTYgen를 시작하고 [Load]를 선택한 후 .ppk 또는 .pem 파일을 선택. PuTTYgen에. 퍼블릭 키가 표시됨 (출처. AWS 자습서)

#### EC2에서 생성한 keypair 추가 등록
- keypair 생성 및 public key 확인은 하단 'EC2 keypair 생성' 참고
1. 기존 키를 사용하여 instance 에 접속
2. ~/.ssh/authorized_keys 에 public Key를 덧붙임 
  - 키 관리를 위해, publickey 적은 후, 공백을 주고 key이름을 덧붙임(하단 예제는 'my-key-pair'가 key 이름임)
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClKsfkNkuSevGj3eYhCe53pcjqP3maAhDFcvBS7O6V
hz2ItxCih+PnDSUaw+WNQn/mZphTk/a/gU8jEzoOWbkM4yxyb/wB96xbiFveSFJuOp/d6RJhJOI0iBXr
lsLnBItntckiJ7FbtxJMXLvvwJryDUilBMTjYtwB+QhYXUMOzce5Pjz5/i8SeJtjnV3iAoG/cQk+0FzZ
qaeJAAHco+CY/5WrUBkrHmFJr6HcXkvJdWPkYQS3xqC0+FmUZofz221CBt5IMucxXPkX4rWi+z7wB3Rb
BQoQzd8v7yeb7OzlPnWOyN0qFU0XA246RA8QFYiCNYwI3f05p6KLxEXAMPLE my-key-pair
```
- 기존 키를 사용하지 않을 경우, 앞서 적힌 키는 지운다. authorized_keys에서 삭제한 후에도 인스턴스 메타데이터에 남아있을 수 있음

### 데이터분석환경 EC2로 설정하기
- 프리티어를 사용해 무료 범위의 인스턴스를 사용함.
- R, Hadoop은 메모리 사용량이 많으므로, 메모리 특화된 인스턴스를 설치
1. [AWS - Amazon EC2로 설정](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/get-set-up-for-amazon-ec2.html) 참고해 아래의 작업 실행
- AWS 가입 / IAM 사용자 생성 / 키 페어 생성 / Virtual Private Cloud(VPC) 생성 / 보안 그룹 생성
    - 키 페어 저장경로 : /aws 로 따로 관리하거나 ssh 접속 편의를 위해 /.ssh 에 저장.
    - 키 페어를 이용한 접속시, [Mac-ssh-접속-편하게-만들기](http://thddudco.tistory.com/entry/Mac-ssh-접속-편하게-만들기) 참고해 `ssh aws`간단한 명령어로 접속가능하도록 설정함.
    - `sudo vim ~/.ssh/config` 사용해 아래 내용 설정. instance 생성된 후 '3.[AWW - Linux 인스턴스에 연결]'항목을 참고해 내용 바꿔줌.
    ```
    Host aws
        HostName $호스트 주소$
        User $사용자 계정$
        IdentityFile $파일 경로/파일명.pem$
    ```
    - 보안그룹 생성시, 사전작업 내 로컬PC IP 확인 웹사이트 http://checkip.amazonaws.com
        - R studio 구동을 위해, 8787 포트를 열어둠 (custom TCP / TCP / 8787 / ...)
2. [AWS - 시작 인스턴스 마법사를 사용하여 인스턴스 시작](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/launching-instance.html)
- Step 3: Configure Instance Details : Auto-assign Public IP : Enable 로 설정하기
- 1 항목에서 만들어 둔 key pair 와 security group을 사용함
3. [AWS - Linux 인스턴스에 연결](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/AccessingInstances.html)
- 위에서 만든 인스턴스가 lanch 되면(Instance-Instance 에서 runnint 상태확인) ssh 설정 : 위 1번 항목의 `ssh aws` 설정파일(~/.ssh/config)에 등록
  - HostName : Description 탭의 Public DNS (IPv4)
  - User : ec2-user (선택한 AMI에 따라 다르므로 위 링크의 내용을 참고 Linux 인스턴스에 연결 - SSH를 사용하여 인스턴스에 연결하려면 - '5.~')
4. docker 를 사용하여 기본 분석 패키지 install
- ec2 AMI에 설치되어있는 패키지 확인
  - [AWS Doc - EC2 Linux 인스턴스의 소프트웨어 패키지 찾기](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/find-software.html)
  - `yum groupinfo $그룹 이름$` : 해당 그룹에 설치되어 있는 패키지 확인 / `yum grouplist` 시스템에 이미 설치된 그룹 및 설치가능 그룹 나열
- 기본으로 설치되어있는 패키지 확인 ``
- 중복설치는 불필요하지만 빠른 설치를 위해 일단, 기존에 만들어진 이미지를 사용함. 
  - 데이터사이언스스쿨 도커 이미지





