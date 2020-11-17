## memo
- [ ] 7개 이상 토픽 또는 200줄 이상으로 글이 길어지면 토픽별로 분리하기
- python multiprocessing 보다가 CPU-bound 로 넘어가서 How CPU works 로 넘어갔네 랄랄랄라

## CPU-bound
- 프로세스 처리 속도가 CPU 속도에 의해 제한(bound)됨. 다른 component가 연관되지 않고 오로지 CPU 와 연관되어 있음. CPU 가 빠를 수록 프로세스를 빨리 처리할 수 있음. 빨리 처리하고 싶으면 CPU를 업그레이드! 
- 연관 
  - [I/O bound](https://en.wikipedia.org/wiki/I/O_bound)(예. 파일 줄 수 세기, 네트워크 통신),memory bound(예: 큰 행렬 곱하기), cache bound
  - CPU-bound 에서는 성능 병목이 될 수 있는 [python GIL](https://realpython.com/python-gil/) - 코드로 해결 좀 해보자[multiprocessing](https://realpython.com/python-concurrency/#cpu-bound-synchronous-version)
- refernce
  - [What do the terms “CPU bound” and “I/O bound” mean? - stackoverflow](https://stackoverflow.com/a/33510470/6781364)
  - [What Does It Mean to Be CPU Bound?](https://www.wisegeek.com/what-does-it-mean-to-be-cpu-bound.htm)
