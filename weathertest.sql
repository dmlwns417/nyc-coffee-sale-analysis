CREATE TABLE CoffeeSales (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    transaction_time TIME,
    transaction_qty INT,
    store_id INT,
    store_location VARCHAR(255),
    product_id INT,
    unit_price DECIMAL(10, 2),
    product_category VARCHAR(255),
    product_type VARCHAR(255),
    product_detail VARCHAR(255)
);

CREATE TABLE AstoriaWeather (
    time DATETIME,
    temp DECIMAL(5, 2),
    dwpt DECIMAL(5, 2),
    rhum DECIMAL(5, 2),
    prcp DECIMAL(5, 2),
    wdir DECIMAL(5, 2),
    wspd DECIMAL(5, 2),
    pres DECIMAL(7, 2),
    coco INT,
	location VARCHAR(255)
);


CREATE TABLE HellsKitchenWeather (
    time DATETIME,
    temp DECIMAL(5, 2),
    dwpt DECIMAL(5, 2),
    rhum DECIMAL(5, 2),
    prcp DECIMAL(5, 2),
    wdir DECIMAL(5, 2),
    wspd DECIMAL(5, 2),
    pres DECIMAL(7, 2),
    coco INT,
	location VARCHAR(255)

);

CREATE TABLE LowerManhattanWeather (
    time DATETIME,
    temp DECIMAL(5, 2),
    dwpt DECIMAL(5, 2),
    rhum DECIMAL(5, 2),
    prcp DECIMAL(5, 2),
    wdir DECIMAL(5, 2),
    wspd DECIMAL(5, 2),
    pres DECIMAL(7, 2),
    coco INT,
	location VARCHAR(255)

);

CREATE TABLE NewCoffeeSalesWeather AS
SELECT
    -- CoffeeSales 테이블의 전체 컬럼
    c.transaction_id,
    c.transaction_date,
    c.transaction_time,
    c.transaction_qty,
    c.store_id,
    c.store_location,
    c.product_id,
    c.unit_price,
    c.product_category,
    c.product_type,
    c.product_detail,

    -- AstoriaWeather 컬럼
    a.temp  AS AT_temp,
    a.dwpt  AS AT_dwpt,
    a.rhum  AS AT_rhum,
    a.prcp  AS AT_prcp,
    a.wdir  AS AT_wdir,
    a.wspd  AS AT_wspd,
    a.pres  AS AT_pres,
    a.coco  AS AT_coco,

    -- HellsKitchenWeather 컬럼
    h.temp  AS HK_temp,
    h.dwpt  AS HK_dwpt,
    h.rhum  AS HK_rhum,
    h.prcp  AS HK_prcp,
    h.wdir  AS HK_wdir,
    h.wspd  AS HK_wspd,
    h.pres  AS HK_pres,
    h.coco  AS HK_coco,

    -- LowerManhattanWeather 컬럼
    l.temp  AS LM_temp,
    l.dwpt  AS LM_dwpt,
    l.rhum  AS LM_rhum,
    l.prcp  AS LM_prcp,
    l.wdir  AS LM_wdir,
    l.wspd  AS LM_wspd,
    l.pres  AS LM_pres,
    l.coco  AS LM_coco

FROM CoffeeSales AS c

-- 1) AstoriaWeather
LEFT JOIN AstoriaWeather AS a
    ON c.store_location = a.location
    AND c.transaction_date = DATE(a.time)
    AND HOUR(c.transaction_time) = HOUR(a.time)

-- 2) HellsKitchenWeather
LEFT JOIN HellsKitchenWeather AS h
    ON c.store_location = h.location
    AND c.transaction_date = DATE(h.time)
    AND HOUR(c.transaction_time) = HOUR(h.time)

-- 3) LowerManhattanWeather
LEFT JOIN LowerManhattanWeather AS l
    ON c.store_location = l.location
    AND c.transaction_date = DATE(l.time)
    AND HOUR(c.transaction_time) = HOUR(l.time)
;



