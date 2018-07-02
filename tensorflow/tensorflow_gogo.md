## tf.layees
- vs nn
- get_collection - variable 확인할때 유용 - http://eyeofneedle.tistory.com/24
- 무얼 선택해야할까? low level 설정, 얼마나 customize 할 수 있는가? 에 따라

## tf.estimator
- reference : https://www.tensorflow.org/api_docs/python/tf/estimator
- tensorflow의 [scikit-learn](http://scikit-learn.org/stable/index.html) 느낌
- wrapping! 모델 customize가 어렵
- 구글에서 관심을 가지고 미는 코드? 계속 업데이트가 되고 있음. 아직까지는 시기상조?

## tf.train
- ref https://www.tensorflow.org/api_docs/python/tf/train
- Optimizer, saver 를 많이 씀
    + 발표자는 tf.train.exponential_decay 대신 조건문 걸어서 사용함. 

##  tf.test
- ref: https://www.tensorflow.org/api_docs/python/tf/test
- multi GPU controll시에 사용했음.
- 발표자는 그 외에는 잘 사용안함.

## TF Record
- comprepssion! 복잡하더라도 전처리를 해서 나중에 큰 데이터 쓰기 편하게. 빨라짐
- 단점 - 번거로워요 
    - related : hdf5
    +  tf 는 그정도로 편하지 않음 - session 열어서 접근해야하기때문에
    +  단일 이미지가 어느 정도 크기 이상이면 에러가 남 - 고화질 3D 이미지같은

## TF data
- ref : https://www.tensorflow.org/api_docs/python/tf/data
- repeat() 
    + Tip. repeat 횟수를 정하지 말고, 계속 돌리긔. 모니터링 하다가 더 이상 개선되지 않으면 그때 stop

### tf.py_func
- ref: https://www.tensorflow.org/api_docs/python/tf/py_func
- python type 을 사용할 수 있게 해줌
- 대신 또 wrapping한거라서 느려질 수 있음. 하지만 시간 차이 엄청나는 것도 아니고 편리하니까여

### tf.data
- [TensorFlow - Develop - Programmer's Guide - Importing Data](https://www.tensorflow.org/programmers_guide/datasets)

## tf.gfile
- glob 구현. 안에서 쓰기 편하도록.

## checkpoint
- 특정 layer의 weight 지점에서 save해서 나중에 load 
- weight 만 불러오는게 왜 중요하죠?

## tf.keras
- 현재 tensorflow 안에 keras가 있으나 조금 느림

## tf
- tf.slim 으로 학습된 모델을 그대로 쓸 수 있음
- 모델 자체의 slim이 아니라 코드가 slim
- with 구문의 argument 정의해서 

## Model exporting 
- saver
  - more. 가장 가까운 시점의 checkpoint get
  - more. restore()
- MetaGraphDef

## Serving







