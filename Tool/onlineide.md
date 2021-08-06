# Online IDE
## memo
- 적다보면 웹으로 사용할 수 있는 sandbox 환경도 포함하게 될 듯.

### codespace
- Official Doc : [GitHub Codespaces](https://docs.github.com/en/codespaces/overview)
- Github에서 repo 별로 공간을 만들어서 사용. Azure(cloud) 에 docker 올려서 쓰는 거라고 함. ([Official doc info](https://docs.github.com/en/codespaces/overview#what-is-a-codespace))
  - 2021.08.06 현재 베타기간으로 무료 사용 가능. 이후 유료 결제로 변경될 수 있음.
- vscode 와 동일한 ui 로 vscode plugin 도 사용 가능. 
- codespace + copliot 조합이면 어디서나 스르륵 스르륵 코딩 가능. 평소 쓰고 있는 vscode 유사해서 스르륵 정착해서 사용 가능. 
- [ ] dev container 세팅해서 구성 어디까지 해볼 수 있는지 test / [doc ](https://docs.github.com/en/codespaces/customizing-your-codespace/configuring-codespaces-for-your-project#dockerfile)

### replit
- [replit.com](https://replit.com/)
- Online IDE 중에 유명한 축. 
  - Free 버전 : 0.2-05 vCPU, 500mb memory, 100mb storage
- 결제하게 된 결정적인 계기가 [replit-py](https://replit-py.readthedocs.io/en/latest/)
  - 내장 DB, Auth 사용하면 간단한 페이지를 간결하게 만들 수 있다.
- 만들어 본 [Simple Twitter clone Demo](https://repltweet.ohahohah.repl.co/ ) (replit 로그인 필요) 
  - Based official tutorial 기반의 [project by Scoder12](https://replit.com/@Scoder12/repltweet)
  - publish까지 요금제 결제 포함해서 만드는데 10분도 안 걸림. replit 거의 안 썼는데 직관적으로 쓸 수 있음. DB 파악도 쉽고, auth 사용도 직관적. 
- [ ] replitpy 로 간단 사이트들 더 만들어보고 싶은데 뭐가 있을까? 일상에서 쓰는 거 뭐 있을지 수집해보자. 