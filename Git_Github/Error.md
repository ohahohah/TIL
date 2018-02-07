## Keyword

## Reference
- [stackoverflow - Github “Updates were rejected because the remote contains work that you do not have”](https://stackoverflow.com/questions/18328800/github-updates-were-rejected-because-the-remote-contains-work-that-you-do-not-h)

## 상황 / 궁금
- [문제][해결] [git 에서 https repository 연결시 SSL 인증서 오류 해결법](https://www.lesstif.com/pages/viewpage.action?pageId=14090808)

- [문제]github에서 remote로 push할때 에러 발생
- git rebase inactive error 
  - https://stackoverflow.com/questions/29902967/rebase-in-progress-can-not-commit-how-to-proceed-or-stop-abort
```
PS C:\Users\Daumsoft-N144\Documents\TIL> git push
fatal: You are not currently on a branch.
To push the history leading to the current (detached HEAD)
state now, use

    git push origin HEAD:<name-of-remote-branch>

PS C:\Users\Daumsoft-N144\Documents\TIL> git status
interactive rebase in progress; onto 26cbcd6
Last commands done (6 commands done):
   pick 15788bb Update 깨달은 점
   edit 54dfa87 Update interesting content
  (see more in file .git/rebase-merge/done)
Next commands to do (12 remaining commands):
   pick 07cafc9 Add booklist to read
   pick 2f5d687 Update 회사프로젝트에서 배운 점
  (use "git rebase --edit-todo" to view and edit)
You are currently editing a commit while rebasing branch 'master' on '26cbcd6'.
  (use "git commit --amend" to amend the current commit)
  (use "git rebase --continue" once you are satisfied with your changes)

nothing to commit, working tree clean
```  
