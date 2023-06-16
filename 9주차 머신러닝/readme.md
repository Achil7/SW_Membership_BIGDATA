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
