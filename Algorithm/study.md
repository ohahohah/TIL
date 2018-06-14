# 알고리즘 스터디 진행사항 기록
- 2018/05/07~ 자유롭게 문제풀기 
- 2018/06/03 coding interview 회고


def f(n, k, j):
    if n == 1:
        return 0
    res = f(n-1, k+j, j)

    if res == 0:
        return k%n -1
    return (res + k%n) % n

    