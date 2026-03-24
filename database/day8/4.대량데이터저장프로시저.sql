

-- 0~999 숫자 테이블 생성
CREATE TABLE nums (
                      n INT PRIMARY KEY
);

INSERT INTO nums (n)
WITH RECURSIVE seq AS (
    SELECT 0 AS n
    UNION ALL
    SELECT n + 1
    FROM seq
    WHERE n < 999
)
SELECT n
FROM seq;

DELIMITER //

DROP PROCEDURE IF EXISTS insert_big_orders //

CREATE PROCEDURE insert_big_orders(IN p_batches INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_offset BIGINT DEFAULT 0;

    WHILE i < p_batches DO
            INSERT INTO orders_big (customer_id, product_id, order_date, status, amount, city, memo)
SELECT
    FLOOR(1 + RAND(v_offset + a.n * 1000 + b.n) * 500000),
    FLOOR(1 + RAND((v_offset + a.n * 1000 + b.n) * 2) * 5000),
    TIMESTAMP('2023-01-01')
    + INTERVAL FLOOR(RAND((v_offset + a.n * 1000 + b.n) * 3) * 1095) DAY
    + INTERVAL FLOOR(RAND((v_offset + a.n * 1000 + b.n) * 4) * 86400) SECOND,
    ELT(FLOOR(1 + RAND((v_offset + a.n * 1000 + b.n) * 5) * 4), 'READY', 'PAID', 'SHIPPED', 'CANCELLED'),
    FLOOR(1000 + RAND((v_offset + a.n * 1000 + b.n) * 6) * 1000000),
    ELT(FLOOR(1 + RAND((v_offset + a.n * 1000 + b.n) * 7) * 6), 'Seoul', 'Busan', 'Incheon', 'Daegu', 'Daejeon', 'Gwangju'),
    CONCAT('memo-', i, '-', a.n, '-', b.n)
FROM nums a
    CROSS JOIN nums b;

SET i = i + 1;
            SET v_offset = v_offset + 1000000;
END WHILE;
END //

DELIMITER ;