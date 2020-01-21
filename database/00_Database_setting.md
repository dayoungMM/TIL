## 데이터베이스

여러 사람들이 공유하고 사용할 목적으로 통합 관리되는 정보의 집합



## 데이터 베이스 종류

- MariaDB
- Oracle
- Ms-SQL



### SQL

- structured query language
- ANSI SQL



### 연결 프로그램

- WebServer(Spring) <-> Browser
- DBServer(MariaDB) <-> Tool(HeidiSQL),  #맥북인경우 Workbench



### 명령어

- create
- read
- update
- delete



### 인스턴스 확인

> window+R >이름에서 MariaDB 확인 > 껐다 켰다 할 수 있음



### 키

- 기본키 (유일성, 최소성)
- 대체키 (유일성,최소성)
- 후보키 = 기본키 +대체키  (유일성, 최소성)
- 슈퍼키 (유일성)
- 외래키(다른 릴레이션의 기본키)



### HeidiSQL에서 한글 깨지는것 해결하기

> 확인 (문자 형태)

```
SHOW VARIABLES LIKE 'c%';
```



> 쿼리 내에서 해결하기

```mariadb
SELECT * FROM noodle;
 SELECT company, 
 	convert(concat(COUNT(*),'개') USING UTF8) AS "COUNT",
 	CAST(concat(COUNT(*),'개') AS VARCHAR(20)) AS "CNT"
 FROM noodle
 group by company;
```



> 환경파일 수정
>
> > C:\ProgramData\Microsoft\Windows\Start Menu\Programs\MariaDB 10.4 (x64)\my.ini

```
[mysqld]
datadir=C:/Program Files/MariaDB 10.4/data
port=3306
innodb_buffer_pool_size=1515M
character-set-server=utf8
[client]
port=3306
plugin-dir=C:/Program Files/MariaDB 10.4/lib/plugin
default-character-set = utf8
```

