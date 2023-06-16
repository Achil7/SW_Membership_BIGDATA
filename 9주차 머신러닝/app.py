# dash 라이브러리 설치
# pip install dash
# pip install dash_bootstrap_components

# 라이브러리 호출
import dash
import dash_bootstrap_components as dbc
import dash_html_components as html
import dash_core_components as dcc

# Dash 함수를 불러와서 Web을 구성
app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])  # external_stylesheets : 웹 테마
##############################################################################################################################################################################################################
# 데이터를 불러와 처리하는 부분 :: 이 부분을 Web에 표시되는 부분을 구성하는 Part에 전달해야 함
import pandas as pd
import plotly.express as px

df1 = pd.read_csv('./data/01_Data.csv')
p1 = df1.pivot_table(index = 'Channel', values = 'Amount_Month', aggfunc = 'sum').reset_index()

fig1 = px.bar(p1, x = 'Channel', y = 'Amount_Month')
##############################################################################################################################################################################################################
# Call back (웹에서 입력받은 값을 처리해 다시 출력해주는 함수를 구성) --> pandas의 apply와 비슷한 개념이라고 생각하면 됨
from dash.dependencies import Input, Output
import pickle

model = pickle.load(open('./실습 저장파일/model_RF.sav', 'rb'))

@app.callback(
    Output('result', 'children'),       # 이 'result'를 Web에 표시되는 구성에 넣어주면 됨 (result 이름은 임의이름값, children은 시스템 지정값)
    Input('Term', 'value'),             # Input Layout 부분의 id = 'term'값에 입력되는 값을 'value'값으로 받아옴 (term 이름은 아래 input_layer의 임의이름값, value는 시스템 지정값)
    Input('Amount_Month', 'value'),
    Input('Product_Type', 'value'),
    Input('Age', 'value'),
    Input('Gender', 'value'),
    Input('Credit_Rank', 'value'),
)
def function1(x1,x2,x3,x4,x5,x6) :                   # 이 부분의 최종 값을 Output의 'result'값으로 보내줌 --> 이 'result'를 Web에 표시되는 구성에 넣어주면 됨
    input_data = pd.DataFrame(data = [[x1,x2,x3,x4,x5,x6]], columns=['Term','Amount_Month','Product_Type','Age','Gender','Credit_Rank'])
    result = model.predict_proba(input_data)[0][1]
    return f'{result:.2f} %'


# def func1(x1) :                   # 이 부분의 최종 값을 Output의 'result'값으로 보내줌 --> 이 'result'를 Web에 표시되는 구성에 넣어주면 됨
    # return x1 + ' 계약'


##############################################################################################################################################################################################################
# Input Layout (모델에 들어갈 값을 입력하는 공간)
input_layout = [
    # html.Div([ html.Label('계약기간'), dcc.Input(id = 'Term', type = 'text') ]),    # '계약기간'이라는 라벨이름, Input공간( term이름은 임의이름값, type는 text는 시스템 지정값)
    html.Div([ html.Label('계약기간'), dcc.Input(id = 'Term', type = 'text') ]),
    html.Div([ html.Label('월 렌탈비용'), dcc.Input(id = 'Amount_Month', type = 'text') ]),
    html.Div([ html.Label('제품군'), dcc.Input(id = 'Product_Type', type = 'text') ]),
    html.Div([ html.Label('고객 연령'), dcc.Input(id = 'Age', type = 'text') ]),
    html.Div([ html.Label('고객 성별'), dcc.Input(id = 'Gender', type = 'text') ]),
    html.Div([ html.Label('신용 등급'), dcc.Input(id = 'Credit_Rank', type = 'text') ])    
    
]


# Web에 표시되는 부분을 구성
# ---> 데이터를 불러와 처리하는 부분을 가져와야 함 & input_layout이 있을경우 input_layout을 가져와야함
app.layout = dbc.Container(
    [ html.H3(children='렌탈 계약 고객 관리 System'),    # 제목
      dbc.Col(html.Div(input_layout)),                   # 위의 Input Layout 을 입력
      html.H2(id ='result'),                             # 
      html.Div(dcc.Graph(figure=fig1))                   # 그래프 출력
      
      
     ]
)

##############################################################################################################################################################################################################
# 구성된 Web을 구동하는 코드
if __name__ == '__main__':
    app.run_server(debug = True)

