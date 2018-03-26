## Keyword
`python` `python virtualenv`

## Reference
- [conda - Managing environments](https://conda.io/docs/user-guide/tasks/manage-environments.html#viewing-a-list-of-your-environments)

## 정리
### anaconda 를 사용한 virtual enviorment 관리
- `conda env list` / `conda info --envs` : 설치되어있는 가상환경 리스트 확인
- `conda list -n 가상환경이름` : 해당 가상환경에 설치되어있는 pacakge확인
- `conda create --name 만들가상환경이름` : create an environment, anaconda폴더 밑 /env 에 생성됨
- `source activate 가상환경이름` | `conda activate 가상환경이름` / `activate 가상환경이름` : Activating an environment On macOS and Linux , in your Terminal Window / On Windows, in your Anaconda Prompt
- `deactivate` / `source deactivate` : Deactivating an environment on Windows / on macOS and Linux
- `conda create --name myclone --clone myenv` : Cloning an environment
- [Sharing an environment](https://conda.io/docs/user-guide/tasks/manage-environments.html#sharing-an-environment)
