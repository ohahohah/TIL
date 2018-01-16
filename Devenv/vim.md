## KeyWord
`vim`

## Reference
- [Vim 편집기 한글화- 도움말](http://vim-ko.github.io/)
- [놀부블로그 - vim에서 한글입출력](https://nolboo.kim/blog/2016/11/07/vim-korean/)
- [kldp- vim 한글 세팅](https://kldp.org/node/85494)
- [kldp- vim 파일인코딩 변경하기](https://kldp.org/node/32987)

## 상황/ 궁금증

## 정리
##### vim 한글세팅
- fence설정 : ~/.vimrc에  `:set fencs=ucs-bom,utf-8,cp949`
- ~/.mswin.vm 에 추가
```
set tabstop=4
set encoding=cp949
set fileencodings=utf-8,cp949
set langmenu=cp949
set guifont=Gulimche:h12:cHANGEUL
set lines=60 columns=120
```

##### vim 파일인코딩 변경
- `:w ++enc=utf-8` (해당 파일 utf-8로 바꾸어 저장)
  - `:e ++enc=utf-8`(임시로 fence 옵션 덮어써 문자인코딩 utf-8로 바꾸어 보여줌)
  - `:set fileencoding=utf-8` (fileencoding 변경)

## Plugin
- [vim-markdown-preview]
