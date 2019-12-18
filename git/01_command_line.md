# Command Line Interface

- cd : 디렉토리 이동
- mkdir : 디렉토리 생성
- touch: 파일생성
- mv`[현재 파일위치 및 파일명] ``[새 파일위치 및 파일명]`: 파일 이동(잘라내기) 또는 파일 이름 바꾸기
- cp : 파일 복사
- rm :파일 삭제
- rm -r :폴더 지우기





#### git

- git add `파일이름`  : 파일 add
- git commit : add한 파일 commit
- git log: commit 한 내역 확인
- git checkout `[특정시점]`:  특정시점의 상태로 돌아가서 확인하기
- git log --oneline: 한줄로 log 이력 보여주기
- git log --oneline --grach: 한줄로 log 이력 보여주면서 그래프도 보여주기
- git init : git 시작하기
- git remote add `[원격저장소 이름] ``[원격저장소 주소]`: 원격저장소와 연결하기
- git remote rename `[원래이름]`` [바뀐이름]`: git remote 바꾸기
- git remote -v :  remote 자세한 설명보기
- git push : commit 한 내용 원격저장소에 보내기
- git clone `repo주소`: repository를 복제
- git pull `[원격저장소 이름]``[현재 branch]`: 업데이트된 원격저장소 로컬에 가져오기
- git branch : 브랜치 위치 확인하기
- git switch [이동할 브랜치 이름] : 브랜치 이동하기
- (구버전) git checkout [이동할 브랜치 이름/ log 숫자]: 브랜치 이동하기, 과거 log 볼때
- git merge [가져와서 이곳에 병합할 브랜치 이름] : 병합하기
- git branch -d new : 브랜치 삭제
- git reset reset [되돌아가고싶은 상태의 log 번호] : 과거로 rollback (되도록 사용하지 말자)
- git rm --cached [파일명] :add 한것 삭제

[참고] : 폴더명 변경, 파일의 위치 이동시 
- git add -u를 하면 renamed 된 파일까지 add가 가능하다



####  [참고] : git으로 관리되는 폴더 내에 또다른 git으로 관리되는 폴더를 생성시

- 새로 생성한 git으로 관리되는 폴더를 삭제한다
- rm -r [폴더명]
- 또는 새로 생성한 git 폴더 내부의 .git 파일을 삭제한다

