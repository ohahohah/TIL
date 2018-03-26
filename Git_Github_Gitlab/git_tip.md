## Keyword
`git tip` `git plugin` `git`

## Reference

## 정리
- [git autocompletion script](https://apple.stackexchange.com/questions/55875/git-auto-complete-for-branches-at-the-command-line)
  - Using git + `tab` like autocompletion. It auto-complete for branches.
    - 비슷한 기능 : [git-flow-completion](https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion) / homebrew로 제공
  - `curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash`
  - add to ~/.bash_profile
  ```
  if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  fi
  ```
  - Give the script permission to run : `chmod -X ~/.git-completion.bash` 

