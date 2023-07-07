# 특정 GPU 사용

```python
# 아래전체 gpu 사용
import os
os.environ["CUDA_VISIBLE_DEVICES"] = '0'
```

  
# Tensorflow GPU 확인

```python
import tensorflow as tf
tf.__version__
```

```python
from tensorflow.python.client import device_lib
print(device_lib.list_local_devices())
tf.test.is_gpu_available()
```

# CPU vs GPU
```python
import time
from sklearn.datasets import make_regression
from xgboost import XGBRegressor

def model_test(model_name, model):
    x, y = make_regression(n_samples=100000, n_features=100)
    
    start_time = time.time()
    model.fit(x, y)
    end_time = time.time()
    return f'{model_name}: 소요시간: {(end_time - start_time)} 초'

xgb = XGBRegressor(n_estimators=1000, 
                   learning_rate=0.01, 
                   subsample=0.8, 
                   colsample_bytree=0.8,
                   objective='reg:squarederror', 
                  )

print(model_test('xgb (cpu)', xgb))

xgb = XGBRegressor(n_estimators=1000, 
                   learning_rate=0.01, 
                   subsample=0.8, 
                   colsample_bytree=0.8,
                   objective='reg:squarederror', 
                   tree_method='gpu_hist')

print(model_test('xgb (gpu)', xgb))
```

# PyTorch GPU 확인

```python
# pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html

import torch
print(torch.__version__)
USE_CUDA = torch.cuda.is_available()
print(USE_CUDA)

device = torch.device('cuda:0' if USE_CUDA else 'cpu')
print('학습을 진행하는 기기:',device)

```

# PyTorch는 GPU로 데이터와 모델을 전송해야 함

```python
X_train = X_train.to(device)
X_train.is_cuda # >> True
###########################
model = MyModel(args)
model.to(device)
```

