디엠씨코넷_SW기업멤버십_빅데이터과정교육
<br>
문자열 특수문자 전처리 사용자 정의 함수
```
def removePuncuations(string) :
    punctuations = ['.', ',', '!', '?', ':', ';']
    for mark in punctuations:
        string = string.replace(mark, ' ')
    return string
```

<br>
<br>

.py 파일을 .ipynb 로 변환하는 법
!pip install ipynb-py-convert

!ipynb-py-convert a.py a.ipynb
*이때 파일이름을 a로 변환해서 하면 편함*


<br>

!!유용!!
`pandas_profiling`
데이터에 대해 기본적인 분석 및 시각화를 전부 보여줌
