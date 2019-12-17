# Command Line Interface

- cd : 디렉토리 이동
- mkdir : 디렉토리 생성
- touch: 파일생성
- mv: 파일 이동
- cp : 파일 복사





#### git

- git add `파일이름`  : 파일 add
- git commit : add한 파일 commit
- git log: commit 한 내역 확인
- git checkout `[특정시점]`:  특정시점의 상태로 돌아가서 확인하기
- git log --oneline: 한줄로 log 이력 보여주기
- git init : git 시작하기
- git remote add `[원격저장소 이름] ``[원격저장소 주소]`: 원격저장소와 연결하기
- git remote rename `[원래이름]`` [바뀐이름]`: git remote 바꾸기
- git remote -v :  remote 자세한 설명보기
- git push : commit 한 내용 원격저장소에 보내기
- git clone `repo주소`: repository를 복제
- git pull `[원격저장소 이름]``[현재 branch]`: 업데이트된 원격저장소 로컬에 가져오기



#### [참고] : 폴더명 변경, 파일의 위치 이동시 

- git add -u를 하면 renamed 된 파일까지 add가 가능하다