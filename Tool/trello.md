## Keyword
`trello`

## 상황
- 현재 업무에서 issue tracking system이 없고, 업무가 구두로 주어져서 tracking 이 안되고 일감관리가 안됨. PM과 소통을 위해서 개인적으로 trello를 도입해서 사용.
- 개인task 관리에도 pomodoro를 연동해서 적기 시작함.
- project별 board와 backlog 등 전체적인 일의 흐름을 보는 board를 따로 관리하고, 협업을 하다보니 하나의 카드 내용을 여러 board에서 써야할 함.
- 수동으로 입력하기에는 너무 번거로워서 카드간 sync방법을 찾음. 

## 정리
### Card sync
#### card sync 헤매기
- 그동안 유용하게 사용했던[CardsSync](https://trello.com/b/d0ZabOQ7/cardsync) (무료로 5개까지의 card간 sync)는 더 이상 신규 가입을 받지 않음
- trello 에서 소개한 [Mirroring Cards](https://help.trello.com/article/1097-mirroring-cards) 에서 two-way sync 는 모두 유료임
- https://github.com/bitzesty/cardsync 이런 식으로 token과 card id를 사용해서 mirroring 할 수도 있으나, 이미 3년전 데이터이고 업데이트가 이루어지지 않음. 직접 개발할까 고민했으나 시간이 없음
- 1차 결론 : 돈을 쓰자

#### card sync 플러그인 고르기
0. 고려사항
- 내가 해주는 설정이 최대한 적어야함. 사용이 편리해야함.
- 가장 가성비가 높은 플러그인은?(부가기능없이 card sync만 있어도 됨)

1. 후보 [unito](https://unito.io) - 최종선택
- 14일 trial 이 있음
- github 등 다른 서비스와도 연동 가능
- sync수에 제한이 없음

2. 후보 [card sync](https://teams.cardsync.xyz/)
- 1개의 카드를 n개의 보드에 sync하는데 유리함. 이걸 group개념으로 봄. 최소 요금제는 5group/5$
- 많은 수의 card를 sync해야하므로 나에겐 맞지 않음

3. 후보 [placket](https://help.placker.com/getting-started/frequently-asked-questions-other/how-can-i-mirror-cards-between-two-trello-boards)
- Pro 요금제부터 card-mirror 제공. (24.98$/월 (최소2인)부터 시작)
- trello관련 다른 부가기능 제공.
- 가격이 비쌈. 
