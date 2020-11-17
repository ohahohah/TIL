## memo
- 앞으로 path를 소문자로만 적을 것이기 때문에, 파일명이 소문자다. 
- 영상을 보니 GIL을 '길' 이라고 발음한다.

## What is python's GIL
- [GIL(Global_interpreter_lock) - wikipedia](https://en.wikipedia.org/wiki/Global_interpreter_lock) 
  - thread간 동기화시에 race conditions 방지와 thread-safety를 위해 global lock 을 점유해야만 코드가 실행되게 하는 것. 동시에 하나의 thread만 interpeter를 제어함. intepreter가 정말 lock 됨. 동시에 여러 thread 가 실행될 수 없음
  - 장점으로는 단일 thread 프로그램 속도가 빠르고 구현이 쉬움.
  - 단점으로는 concurrency 해서 도달할 수 있는 양도 제한되고, CPU bound에서는 multithread 를 해도 오히려 성능이 떨어질 수 있음(lock하고 relase하는 시간 때문에).

- 그러니까, 기본적으로 CPU가 여러 개 있더라도 한 번에 하나의 스레드 만 python 작업을 수행 할 수 있음. multi-threading 에서는 일정 바이트 코드가 실행될 때마다 context swithing이 발생함.
- 왜 이런 선택을 했을까? 
  - 기존 C 라이브러리를 python 에 통합할 때 thread-safety한 게 매우 큰 장점이 되었고, 
    - GC에서도 GIL 이 유용함. python GC 에서는 객체가 reference count 가 0일 때 메모리에서 해제됨. 만약 multi-thread에서 어떤 객체를 사용한다면, 모든 객체에 lock을 걸어야 제대로 reference count 가 되버림. 와........ 
- Guido van Rossum 은 sigle thread 성능 이상일 때만 GIL을 제거하는 패치를 환영한다고 이야기함.([It isn't Easy to Remove the GIL by Guido van van Rossum September 10, 2007](https://www.artima.com/weblogs/viewpost.jsp?thread=214235))
- Reference
  - [GIL - python wiki](https://wiki.python.org/moin/GlobalInterpreterLock#line-31)
    - [erik@python3.guide](https://python3.guide/python-concurrency/the-python-gil)
    - [Thread State and the Global Interpreter Lock in Python3 doc](https://docs.python.org/3/c-api/init.html#thread-state-and-the-global-interpreter-lock)
    - [global interpreter lock in docs.python.org/3/glossary](https://docs.python.org/3/glossary.html#term-global-interpreter-lock)
  - [Understanding the Python GIL by David Beazley, PyCon 2010](http://www.dabeaz.com/python/UnderstandingGIL.pdf)
    - [The Python GIL Visualized by Dave Beazley](http://dabeaz.blogspot.com/2010/01/python-gil-visualized.html)
  - [PEP 311 -- Simplified Global Interpreter Lock Acquisition for Extensions](https://www.python.org/dev/peps/pep-0311/)
  - [What Is the Python Global Interpreter Lock (GIL)?](https://realpython.com/python-gil/)
  - [파이썬 GIL 깊숙히! (上) by hyeshik,2006-11-12](http://openlook.org/wp/cb-1136/)
  - [The Why, When, and How of Using Python Multi-threading and Multi-Processing by Thilina Rajapakse in Towards AI](https://medium.com/towards-artificial-intelligence/the-why-when-and-how-of-using-python-multi-threading-and-multi-processing-afd1b8a8ecca)


## GIL을 우회하는 방법 - Multiple Interpreters(sub interpreter)?
- GIL 이 multiprocessor 에서 단점 때문에 말이 많았음. 그래서 GIL 을 우회하기 위해 multi interpreter 를 제안함. [PEP 554 -- Multiple Interpreters in the Stdlib](https://www.python.org/dev/peps/pep-0554/#provisional-status). 
  - python 3.8에서, 3.9에서 적용될 꺼야 라고 했는데, 아직 3.9에 적용이 안된듯.
  - [PEP 554 for 3.9 or 3.10? by Eric Snow, 2020-04-17 in Mailman 3 python.org](https://mail.python.org/archives/list/python-dev@python.org/thread/3HVRFWHDMWPNR367GXBILZ4JJAUQ2STZ/)
- cf.
  - [Larry Hastings - Removing Python's GIL: The Gilectomy - PyCon 2016](https://youtu.be/P3AyI_u66Bw)
  - [Has the Python GIL been slain? by hackernoon](https://hackernoon.com/has-the-python-gil-been-slain-9440d28fa93d) / [파이썬 GIL은 사라질까? (Has the Python GIL been slain?) 김성연님 한글번역](https://seonghyeon.dev/has-the-python-gil-been-slain)
  - [Subinterpreters for Python By News Himalaya, 2020-05-13](https://newshimalaya.com/2020/05/13/subinterpreters-for-python/)
