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

# PyTorch GPU 확인

```python
# pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html

import torch
print(torch.__version__)
torch.cuda.is_available()
```

```python
# 아래전체 gpu 사용
import os
os.environ["CUDA_VISIBLE_DEVICES"] = '0'
```
