__RocCurve 시각화__\
참고 'https://scikit-learn.org/stable/auto_examples/model_selection/plot_roc.html'

--------------------------------------------------------------------------------------------

__Python Confusion Matrix(오차행렬)__
```python
from pycm import *
```
참고 : https://pypi.org/project/pycm/

--------------------------------------------------------------------------------------------

__GridSearchCV__\
참고 : https://velog.io/@hyunicecream/GridSearchCV%EB%9E%80-%EC%96%B4%EB%96%BB%EA%B2%8C-%EC%82%AC%EC%9A%A9%ED%95%A0%EA%B9%8C

--------------------------------------------------------------------------------------------

__성능 좋은 알고리즘 찾기(큰 틀) --> Pycaret__\
참고 : https://pycaret.gitbook.io/docs/get-started/quickstart

--------------------------------------------------------------------------------------------

__분류 모델의 평가 지표(Classification_report)__
```python
def evaluation_classifier(model):
    y_train_pred = model.predict(x_train)
    y_test_pred = model.predict(x_test)
    
    report_train = classification_report(y_train, y_train_pred, output_dict=True)
    res_train = pd.DataFrame(report_train).T
    
    report_test = classification_report(y_test, y_test_pred, output_dict=True)
    res_test = pd.DataFrame(report_test).T
    display(res_train)
    display(res_test)
```

__회귀 모델의 평가 지표(R², RMSE)__
```python
def evaluation_regressor(model):
    y_train_pred = model.predict(x_train)
    y_test_pred = model.predict(x_test)

    print(f'Train set의 R² : {r2_score(y_train, y_train_pred)}')
    print(f'Test set의 R² : {r2_score(y_test, y_test_pred)}')
    
    print(f'Train set의 RMSE : {np.sqrt(mean_squared_error(y_train, y_train_pred))}')
    print(f'Test set의 RMSE : {np.sqrt(mean_squared_error(y_test, y_test_pred))}')
```

--------------------------------------------------------------------------------------------

__두 집단에 대한 평균비교 (범주 값 문자형)__
```python
def df_hypo(data):
    normal = input('정규성을 검정할 변수를 입력하세요 : ')
    mean_vs = input('평균 비교를 할 변수 명을 입력하세요 : ')
    A = input('평균 비교를 할 변수 명의 첫 번째 범주 값을 입력하세요 : ')
    B = input('평균 비교를 할 변수 명의 두 번째 범주 값을 입력하세요 : ')

    df_A = data.loc[data[mean_vs] == A]
    df_B = data.loc[data[mean_vs] == B]
    
    print(f'''
{normal}의 정규성 검정 실시 :
H0 : {normal}의 분포는 정규성을 따른다.
H1 : {normal}의 분포는 정규성을 따르지 않는다.
    ''')
    res_normal = stats.normaltest(data[normal])
    if res_normal[1] < 0.05:
        print(f'검정 결과 : p-value 값은 {res_normal[1]} 이므로 H0을 기각한다. 즉, {normal}의 분포는 정규성을 띄지 않는다.')
        
    
    
        print('==' * 60)
        print(f'''
{mean_vs}의 {A}인 집단과 {B} 집단의 평균검정 실시 --> 정규성을 띄지 않으므로 윌콕슨 순위합 검정 실시(ranksums)
H0 : {A}와 {B} 평균차이는 없다.
H1 : {A}와 {B} 평균차이는 있다.
        ''')
        res_rank = stats.ranksums(df_A[normal], df_B[normal])
        
        if res_rank[1] < 0.05:
            print(f'검정 결과 : p-value 값은 {res_rank[1]} 이므로 H0을 기각한다. 즉, {A}와 {B}에 대한 {normal}의 평균차이는 있다.')
            print('==' * 60)
        else:
            print(f'검정 결과 : p-value 값은 {res_rank[1]} 이므로 H0을 채택한다. 즉, {A}와 {B}에 대한 {normal}의 평균차이는 없다.')
            print('==' * 60)
            
        
    else:
        print(f'검정 결과 : p-value 값은 {res_normal[1]} 이므로 H0을 채택한다. 즉, {normal}의 분포는 정규성을 띈다.')
        print('==' * 60)
    
    
        print(f'''
{normal}의 등분산 검정 실시
H0 : {A}, {B} 에 대한 {normal}의 분산은 같다.
H1 : {A}, {B} 에 대한 {normal}의 분산은 다르다.
        ''')
        res_std = stats.bartlett(df_A[normal], df_B[normal])
        if res_std[1] < 0.05:
            print(f'검정 결과 : p-value 값은 {res_std[1]} 이므로 H0을 기각한다. 즉, 두 집단간 {normal}의 분산은 다르다.')
            print('==' * 60)
            
            print(f'''
{A}, {B} 그룹에 따른 평균검정 실시(이분산 가정하에)
H0 : {A}와 {B}에 대한 {normal}의 평균차이는 없다.
H1 : {A}와 {B}에 대한 {normal}의 평균차이는 있다.
            ''')
            
            res_ttest_dif_var = stats.ttest_ind(df_A[normal], df_B[normal], equal_var=False)
            if res_ttest_dif_var[1] < 0.05:
                print(f'검정 결과 : p-value 값은 {res_ttest_dif_var[1]} 이므로 H0을 기각한다. 즉, 두 집단간 {normal}의 평균 차이는 있다.')
                print('==' * 60)
            
            else:
                print(f'검정 결과 : p-value 값은 {res_ttest_dif_var[1]} 이므로 H0을 채택한다. 즉, 두 집단간 {normal}의 평균 차이는 없다.')
                print('==' * 60)
                
                
        else:
            print(f'검정 결과 : p-value 값은 {res_std[1]} 이므로 H0을 채택한다. 즉, 두 집단간 {normal}의 분산은 같다.')
            print('==' * 60)
            
            print(f'''
{A}. {B} 그룹에 따른 평균검정 실시(등분산 가정하에)
H0 : {A}와 {B}에 대한 {normal}의 평균차이는 없다.
H1 : {A}와 {B}에 대한 {normal}의 평균차이는 있다.
            ''')
            
            res_ttest_eql_var = stats.ttest_ind(df_A[normal], df_B[normal], equal_var=True)
            if res_ttest_eql_var[1] < 0.05:
                print(f'검정 결과 : p-value 값은 {res_ttest_eql_var[1]} 이므로 H0을 기각한다. 즉, 두 집단간 {normal}의 평균 차이는 있다.')
                print('==' * 60)
            
            else:
                print(f'검정 결과 : p-value 값은 {res_ttest_eql_var[1]} 이므로 H0을 채택한다. 즉, 두 집단간 {normal}의 평균 차이는 없다.')       
                print('==' * 60)
    
    print(f'''
    {A} 집단의 평균 : {df_A[normal].mean()}
    {B} 집단의 평균 : {df_B[normal].mean()}
    ''')
```
