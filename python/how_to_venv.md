# 가상환경 만들기 방법

1. 파이썬에서 기본적으로 제공하는 venv 모듈 사용

   - 파이썬 버전을 다르게 할 수 없다는 한계

2. 아나콘다에서 제공하는 venv 사용

   - cmd 창에서 실행

   ```shell
   ### 아나콘다 설치 디렉토리의 envs 디렉토리에 생성
   > conda create --name <가상환경 이름>
   
   ### 가상환경 실행
   > activate <가상환경 이름>
   
   ### 가상환경 접속 후 마음대로 설치하거나 제거할 수 있다
   
   ### 가상환경 탈출
   > deactivate
   ```

   - bash script에서 실행

   ```bash
   ### 가상환경 만들기
   $conda create --name <가상환경 이름>
   
   ### 가상환경 실행
   $ source activate <가상환경 이름>
   
   ### 가상환경 탈출
   $ source deactivate
   
   ### 가상환경 지우기
   $ conda env remove -n <가상환경이름>
   
   ### 가항환경 리스트 확인하기
   $ conda info --envs
   ```

   