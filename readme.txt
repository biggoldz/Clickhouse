https://cuddly-blob-cc7.notion.site/7c0a0caca0c0435e9ae3036d7612e4a3
https://cuddly-blob-cc7.notion.site/17cf1c0a2bc743a2af52a2b3fae01e6e


CREATE TABLE dima.h4 (`a` UInt16, `b` String,c1  Enum8('ready'=1,'start'=2,'success'=3,'error'=4) ) ENGINE = Log;

CREATE TABLE dima.h5 (a UInt16, b String, c Enum('one'=1,'two'=2,'three'=3)) ENGINE = Log;


INSERT INTO dima.h5 (a,b,c) VALUES (1,'one','one');
INSERT INTO dima.h5 (a,b,c) VALUES (2,'two','two');
INSERT INTO dima.h5 (a,b,c) VALUES (3,'three','three');

truncate table dima.h5;
select * from dima.h5;

INSERT INTO dima.h5 SELECT * FROM generateRandom() LIMIT 10000;

CREATE TABLE dima.winemag (
    id UInt32,
    country String,
    description String,
    designation String,
    points UInt8,
    price Float32,
    province String,
    region_1 String,
    region_2 String,
    taster_name String,
    taster_twitter_handle String,
    title String,
    variety String,
    winery String
) ENGINE = MergeTree()
ORDER BY id;

// запрос выводит топ-10 стран с самыми дорогими винами.
SELECT 
    country,
    MAX(price) AS max_price
FROM 
    dima.winemag
WHERE 
    country IS NOT NULL 
    AND price IS NOT NULL
GROUP BY 
    country
ORDER BY 
    max_price DESC
LIMIT 10;


//Корреляция между ценой и оценкой дегустатора
SELECT 
    country,
    region_1,
    AVG(price) AS avg_price,
    AVG(points) AS avg_points
FROM 
    dima.winemag
WHERE 
    country IS NOT NULL 
    AND price IS NOT NULL
    AND points IS NOT NULL
GROUP BY 
    country,
    region_1
ORDER BY 
    avg_price DESC;
