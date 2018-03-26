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
