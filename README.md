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
