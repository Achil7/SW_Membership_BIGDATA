# 2주차 Python 기초
<p align="left">
    <a href="https://www.python.org">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Python_logo_and_wordmark.svg/1280px-Python_logo_and_wordmark.svg.png" alt="Python" height="100">
    </a>
</p>

#### _목차_
#### [1. 파이썬 이란?](#파이썬(Python)-이란?)
#### [1. 문자열](#-1.-문자열)

## 파이썬(Python) 이란?
1. 인터프리터 방식의 객체지향 프로그래밍 언어
2. 실행속도는 약간 느리지만 개발이나 업데이트가 쉬움
3. 프로그램 명령어를 한 번에 한 줄씩 읽어 번역한 후 바로 실행

### 특징
- 파이썬은 인간다운 언어이다
- 파이썬은 문법이 쉬워 빠르게 배울 수 있다
- 파이썬은 무료이지만 강력하다
- 파이썬은 간결하다
- 파이썬은 프로그래밍을 즐기게 해준다
- 파이썬은 개발 속도가 빠르다
- 오픈소스 방식을 채택하여 방대한 라이브러리를 무료로 편리하게 이용할 수 있다
- 객체지향 프로그래밍 언어의 특징을 가진다
- 파이썬은 동적 타이핑 (Dynamic Typing) 언어이다

**`동적 타이핑(Dynamic Typing) 특징`**
- `자료의 타입을 일일이 알려줄 필요 없어 코드가 간결해 진다`
- `반면, 런타임 중 자료형 에러가 날 수 있다`
- `사용 언어 : Python, Basic, Ruby, PHP, JavaScript 등`

### 변수명 규칙
- 파이썬 변수 선언 규칙
    1. 영문자(대, 소문자 구분), 숫자, 언더바 사용가능
    2. 기타 특수문자 사용 불가
    3. 중간에 공백이 들어가면 안된다
    4. 첫 자리에 숫자 불가
    5. 대문자와 소문자는 구분된다. EX) APPLE과 apple은 서로 다른 변수명
    6. 변수명 길이에는 제한이 없다
    7. 파이썬 키워드(예약어)는 변수명으로 사용 불가
        - False, None, True, and, as, assert, break, class, continue, def, del, elif , else, except, finally, for, from, global, if, import, in, is, lambda, nonlocal, not, or, pass, raise, return, try, while, with, yield


### 파이썬의 기본 자료구조
|    |자료형|저장 모델|변경 가능성|접근 방법|
|:--:|:----:|:-------:|:---------:|:-------:|
|수치형|int,float,complex|Literal|Immutable|Direct|
|문자열|str|Conatiner|Immutable|Sequence|
|튜플|tuple|Container|Immutable|Sequence|
|리스트|list|Container|Mutable|Sequence|
|사전|dict|Container|Mutable|Mapping|
|집합|set|Container|Mutable|Set|

<br>
  
### 프로그래밍 언어에서 처리할 수 있는 데이터의 유형
- 기본 자료형 - 부울형, 숫자형(정수,실수,복소수), 문자열, 리스트, 튜플, 집합, 딕셔너리
- 객체가 어떤 자료형인지를 알려주는 type() 이라는 함수를 제공

  
 <br>
 <br>
 <br>
 
 
### 논리 연산자
```
>>> a, b, c, d = 10, 20, 30, 40
>>> (a > b) and (c < d)
False

>>> (a > b) or (c < d)
True

>>> (a < b) and (c < d)
True

>>> (a < b) and False
False

>>> (a > b) or True
True
```

# 1. 문자열
- 특수 문자열
- 문자열 연산하기
- 인덱싱(indexing)과 슬라이싱(slicing)
- 문자열은 immutable
- 문자열 포맷팅(formatting)
    1. format 함수를 활용한 포맷팅
    2. f 문자열 포맷팅
