# Python 8.0을 이용하면서 Jupyter notebook 사용할 수 있게 하는법

```
ㅇ visual c++ 2005 설치


ㅇ Lib/asyncio/__init__.py
import asyncio
if sys.platform == 'win32':  # pragma: no cover
    from .windows_events import *
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    __all__ += windows_events.__all__
else:
    from .unix_events import *  # pragma: no cover
    __all__ += unix_events.__all__
```



# VSCode를 이용해 python 이용하기

>  Extension에서 다음의 확장기능을 추가 설치

- AREPL for python
- Node.js Modules Intellisense