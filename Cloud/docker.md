## Keyword
`docker`

## Reference
- [subicura blog - 초보를 위한 도커 안내서 - 도커란 무엇인가?](https://subicura.com/2017/01/19/docker-guide-for-beginners-1.html)
- [popit - 개발자가 처음 Docker 접할때 오는 멘붕 몇가지](http://www.popit.kr/%EA%B0%9C%EB%B0%9C%EC%9E%90%EA%B0%80-%EC%B2%98%EC%9D%8C-docker-%EC%A0%91%ED%95%A0%EB%95%8C-%EC%98%A4%EB%8A%94-%EB%A9%98%EB%B6%95-%EB%AA%87%EA%B0%80%EC%A7%80/)
- [Minimum hardware requirement to run Docker](https://forums.docker.com/t/minimum-hardware-requirement-to-run-docker/28072/5)
- [docker - Get started ](https://docs.docker.com/get-started/)
- [raccoony Blog - Docker (Compose) 활용법 - 개발 환경 구성하기](http://raccoonyy.github.io/docker-usages-for-dev-environment-setup/)
- [Docker 한글 문서 / 영상 모음집](http://documents.docker.co.kr/)
- [pyrasis - 가장 빨리 만나는 도커(Docker)](http://www.pyrasis.com/private/2014/11/30/publish-docker-for-the-really-impatient-book)

## 정리
### What is Hiper-V
- docker for windows 사용하기 위해서는 Windows의 Hiper-V 를 사용해야함.
- [wikipedia - Hyper-V](https://en.wikipedia.org/wiki/Hyper-V)

### Error install image
```
$ docker run hello-world
Unable to find image 'hello-world:latest' locally
C:\Program Files\Docker\Docker\Resources\bin\docker.exe: Error response from daemon: Get https://registry-1.docker.io/v2/library/hello-world/manifests/latest: unauthorized: incorrect username or password.
See 'C:\Program Files\Docker\Docker\Resources\bin\docker.exe run --help'.
```
- 구글링하니 login 먼저 실행해야한다고 함. 내 경우에 이미 로그인 상태라서 해당되지 않음. 
- 로그아웃 후, cygwin을 'Run as Admistration' 함(sudo와 같음) 정상 작동
- [궁금] 부팅시, 아래 메시지 뜨는 것과 연관이 있나?

### Error 
- [Docker hv-sock proxy (vsudd) is not reachable - win 10 pro crash on start](https://github.com/docker/for-win/issues/606)
  - 내 경우, 종료하고 관리자권한으로 실행함. 권한문제 또는 윈도우즈 업그레이드 패치 문제 일 경우가 많음.
```
Docker hv-sock proxy (vsudd) is not reachable
   위치: Docker.Backend.ContainerEngine.Linux.ConnectToVsud(TaskCompletionSource`1 vmId) 파일 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Backend\ContainerEngine\Linux.cs:줄 293
   위치: Docker.Backend.ContainerEngine.Linux.DoStart(Settings settings, String daemonOptions) 파일 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Backend\ContainerEngine\Linux.cs:줄 260
   위치: Docker.Backend.ContainerEngine.Linux.Start(Settings settings, String daemonOptions) 파일 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Backend\ContainerEngine\Linux.cs:줄 130
   위치: Docker.Core.Pipe.NamedPipeServer.<>c__DisplayClass9_0.<Register>b__0(Object[] parameters) 파일 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Core\pipe\NamedPipeServer.cs:줄 47
   위치: Docker.Core.Pipe.NamedPipeServer.RunAction(String action, Object[] parameters) 파일 C:\gopath\src\github.com\docker\pinata\win\src\Docker.Core\pipe\NamedPipeServer.cs:줄 145
```
- 이 메시지 후 `docker version`실행하면 제대로 구동되지 않은 걸 확인할 수 있음.
```
$ docker version
Client:
 Version:       17.12.0-ce
 API version:   1.35
 Go version:    go1.9.2
 Git commit:    c97c6d6
 Built: Wed Dec 27 20:05:22 2017
 OS/Arch:       windows/amd64
error during connect: Get http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.35/version: o                                  pen //./pipe/docker_engine: The system cannot find the file specified. In the de                                  fault daemon configuration on Windows, the docker client must be run elevated to                                   connect. This error may also indicate that the docker daemon is not running.

```
