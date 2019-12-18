## Github로 협업하기

1. PM(Project Manager)

- repository 생성 및 init으로 시작
- collaborator에 Worker의 이메일 추가





2. Worker

* colaborator 초대 수락
* git clone `[PM의 repo 주소]`
* 동기화 완료

-----------------------------------

#### Worker가 새로운 파일 만들어서 push 하기

[worker]: 새로운 파일 업로드 및 기존파일 수정

 [worker]

```bash
$ git add [파일명]
$ git commit -m "[메세지]"
$ git push origin master

```

[PM] :업데이트 하기

```bash
$ git pull origin master
```



#### branch 활용하기

* git branch [새 branch 이름==new]: branch 만들기

앞으로 새 브랜치는 new라고 쓰도록 하겠다

* git switch [new] :[new] 라는 branch로 이동하기
* git checkout [new] :이것도 branch 로 이동하기
* git merge [여기에 가져와서 병합할 브랜치] :병합
* git branch -d [new] : 브랜치 삭제
* git switch -c [new] :브랜치 생성+이동





#### Merge 시나리오

1. fast-forward merge
   - master에서 commit이 없는데 new branch에서만 commit 이 생길때
   - master에서 new branch를 merge해도 충돌이 일어나지 않는다
   - 마치 new가 master의 모든것을 가지고 있어서 new가 master를 덮어 씌운다고 생각하면 된다
2. auto merge
   - merge 시점에 양쪽 branch에 commit이 쌓여있지만 conflict가 발생하지 않는 경우
   - git 이 알아서 merge해준다
3. Merge conflict 발생
   - 양쪽 branch 에 commit들이 쌓여있고, conflict가 발생하는 경우
   - 동일 파일 내에 상충하는 내용이 있을 경우

