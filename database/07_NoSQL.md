## NoSQL

-  NoSQL은 RDBMS와 다른 형태의 데이터 저장 구조를 총칭
- 다수에 서버에 데이터를 상호 복제(replica)하여 분산(shard) 저장할 수 있기 때문에 특정 서버에 장애가 발생하여도 데이터 유실이 거의 없음
- 하나의 고성능 머신을 사용(Scale up)하지 않고 평범한 다수의 일반 PC를 연결하여 병렬적으로 데이터를 처리하는 구조(Scale out)
- 다만 서버가 다운되었다고 하더라도 alarm이 뜨지 않는다.
- 많은 양의 데이터를 input 하고, 중요하지 않은 데이터(log 데이터 등)일 때 주로 사용한다
- 대표적으로 MongoDB가 있다

#### 장점

- 클라우드 환경에 적합
  -  분산 / 병렬 처리 가능
-  유연한 데이터 모델
  - 비정형 데이터 구조
  -  정해진 스키마를 따르지 않고 다양한 모든 형태를 저장

#### 단점

- 일반적인 서버 – 클라이언트 환경에 적합하지 않음
  - 스키마 고정하지 않음

<br><br>

NoSQL 종류

-  Key / Value  Store
  - 대표적으로 Redis
  - MySQL은 여러대의 PC에서 쓸 때 한 PC에서 작업중이라면 commit 을 할때까지 lock이 걸려서 다른 PC에서 작업할 수 없다.(트랜잭션)
  - 그러나 메모리기반으로 한다면 한 PC에서 lock에 걸리더라도 계속 다른 PC에서 데이터를 추가할 수 있다(빅데이터, 분산 처리에 용이)  

![image-20200128142042153](07_NoSQL.assets/image-20200128142042153.png)

- Ordered Key / Value Store

  -  Key 안에 Column:Value 조합으로 된 여러개의 필드를 가지는 구조
  - 대표적으로 HBase, Cassandra

  ![image-20200128142121625](07_NoSQL.assets/image-20200128142121625.png)

  

- Document Key / Value Store

  -  Document 라는 형태로 구조화된 데이터 형태(JSON, XML, YAML 등) 사용
  - MongoDB, CouchDB

  ![image-20200128142801288](07_NoSQL.assets/image-20200128142801288.png)

- Graph Store
  
  - 모델링 하기 어려운 복잡한 계층 구조를 단순하고 신속하게 사용

<br>

<br>

## MongoDB

- 조회 시작할때 메모리를 사용하는 RDBMS와는 달리, MongoDB는 계속 메모리를 사용
-  스키마를 고정하지 않으므로 다양한 형태의 데이터 저장 가능
- JSON 형태의 데이터 사용(Document)
- Join이 불가능하기 때문에 Join이 필요없도록 데이터를 설계해야 됨
- 주로 데이터를 저장하여 조회만 하고 삭제나 수정이 없는 업무에 적합
- 관계나 트랜잭션이 중요한 금융 / 결제 / 게시판 등의 서비스에는 부적합

<br>

<Br>

#### 환경변수 등록

- mongodb/bin

![image-20200128144408203](07_NoSQL.assets/image-20200128144408203.png)



### 실행

- mongo
- mongo --port [포트번호] --dbpath[데이터경로]  

![image-20200128152128374](07_NoSQL.assets/image-20200128152128374.png)



db확인

```
show dbs
use test
db.test_col.save({'key1': 'value1'})
```

<br>

db에 데이터 저장

![image-20200128153421022](07_NoSQL.assets/image-20200128153421022.png)

조건에 따라 검색(15보다 큰 a 검색)

![image-20200128153638578](07_NoSQL.assets/image-20200128153638578.png)

> and 조건

(2보다 크고 4보다 작은 a 검색)
![image-20200128153750185](07_NoSQL.assets/image-20200128153750185.png)

> or 조건

`$gt → >, $lt → <, $gte → >=, $lte → <=, $ne → !=`

- a가 5이거나 99인것

![image-20200128154237008](07_NoSQL.assets/image-20200128154237008.png)

> 제외 : $nin, 포함: $in

![image-20200128160718206](07_NoSQL.assets/image-20200128160718206.png)

> 필드 존재 유무 확인

![image-20200128161304884](07_NoSQL.assets/image-20200128161304884.png)

> 필드 선택(0:해제, 1:선택)

- 기본키 _id 는 디폴트 값이 1, 아래와 같이 0으로 지정해줘야 나오지 않는다

![image-20200128161341737](07_NoSQL.assets/image-20200128161341737.png)

> 데이터 조회 / 조회할 필드 선택 ( a가 2보다 적은 문서의 a 필드 조회 )

![image-20200128161541397](07_NoSQL.assets/image-20200128161541397.png)

> 데이터 수정
>
> > update: 덮어쓰기 
> >
> > set: 기존 데이터에 없으면 추가, 있으면 덮어쓰기
> >
> > unset: 데이터 삭제 (데이터 자체 통째로 삭제)
> >
> > pull : 대괄호를 가지고 있는 경우 일부만 삭제
> >
> > remove: 모든 데이터(테이블, row) 삭제
> >
> > drop: 컬렉션 삭제

```cmd
db.users.save( { name : 'Johnny', lang : [ 'ruby', 'c' ] } )
db.users.save( { name : 'Sue', lang : [ 'python', 'java' ] } )
db.users.update( { name : 'Johnny' }, { name : 'Cash', lang : ['english'] } )
db.users.update( { name : 'Cash'}, { $set : { age : 50 } } 
```



![image-20200128162235078](07_NoSQL.assets/image-20200128162235078.png)

```cmd
 db.users.update({name:'Cash'},{$unset: {age:50}})
```

![image-20200128162449424](07_NoSQL.assets/image-20200128162449424.png)

```cmd
db.users.update( { name : 'Sue' }, { $pull : { lang : 'java' } } )
db.users.update( { name : 'Sue' }, { $push : { lang : 'javascript' } } )
```

![image-20200128162840905](07_NoSQL.assets/image-20200128162840905.png)

```
db.users.remove( { name : 'Sue' })
db.users.remove( { } )
db.users.drop()
```

![image-20200128163133326](07_NoSQL.assets/image-20200128163133326.png)

<br>

<br>

## 연습문제

```
 MongoDB CRUD – 연습문제
 ● prod collection 사용
 ● 100개의 제품 정보를 document에 저장
 - for 반복문 사용
 - 제품정보 필드 : name / price / count
 ㆍname : name-1 ~ name-100
 ㆍprice : 1001 ~ 1100
 ㆍcount : 10 ~ 1000
 ex) {name : 'name-1', price : 1001, count : 10}, …,
 …, {name : 'name-100', price : 1100, count : 1000}
 ● price가 1010원 보다 크거나 같고 1020원 보다 적거나 같은 제품
 또는 price가 1070원 보다 크고 1100원 보다 적은 제품 조회
```

```shell
use test

for (var i=1; i<=100; i++){db.prod.save({name:'name-'+i, price: 1000+i, count:10*i})};

 db.prod.find({$or : [{price:{$gte:1010, $lte:1020}},{price:{$gt:1070, $lt:1100}}]})
 
 
 db.prod.find({$or : [{price:{$gte:1010, $lte:1020}},{price:{$gt:1070, $lt:1100}}]},{_id:0, price:1})
 
 
 db.prod.find({$or : [{price:{$gte:1010, $lte:1020}},{price:{$gt:1070, $lt:1100}}]},{_id:0, price:1}).limit(3)
```



<br>

> index
>
> > 확인: getIndexes()
> >
> > 생성 (1:오름차순, -1:내림차순) :ensureIndex({name: 1})
> >
> > Index 생성 ( unique : 중복 데이터 저장 불가 )
> >
> > Index 삭제 ( 모든 인덱스 삭제 시 dropIndexes() )

```nosql
for (var i = 0; i < 100000; i++) {
 db.users.save(
 {
 i : i,
 username : 'user' + i,
 age : Math.floor(Math.random() * 100),
 created : new Date()
 }
 )
}	

```

시간확인
```
db.users.find( { username : 'user1' } ).explain('executionStats')
```
- "executionTimeMillis" : 110,

인덱스 적용 및 시간확인

```
db.users.ensureIndex( { username : 1 } )

db.users.find( { username : 'user1' } ).explain('executionStats')


```

- "executionTimeMillis" : 0,




### pymongo

![image-20200128170837571](07_NoSQL.assets/image-20200128170837571.png)

![image-20200128170850947](../python/MultiCampus/image-20200128170850947.png)

