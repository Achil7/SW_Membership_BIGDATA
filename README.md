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

--------------------------------------------------------------------------------------------------------------
<br>
*.py 파일을 .ipynb 로 변환하는 법*<br>
`!pip install ipynb-py-convert`

!ipynb-py-convert a.py a.ipynb
*이때 파일이름을 a로 변환해서 하면 편함*
<br>
--------------------------------------------------------------------------------------------------------------

<br>
!!유용!!
`pandas_profiling`
데이터에 대해 기본적인 분석 및 시각화를 전부 보여줌
--------------------------------------------------------------------------------------------------------------

<br>

!!참고!!
python 정규표현식
https://drive.google.com/file/d/1bbKnYkc3BtRQruYePhCxNipE7Ijlp8QH/view?usp=share_link


<br>
--------------------------------------------------------------------------------------------------------------
!!참고!!
matplotlib 한글 폰트 깨질 때
```
from matplotlib import font_manager, rc
font_fname = 'C:/windows/fonts/HANBatang.ttf'
font_name = font_manager.FontProperties(fname=font_fname).get_name()
rc('font', family=font_name)
```
--------------------------------------------------------------------------------------------------------------
