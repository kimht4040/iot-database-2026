-- orders_big 테이블 생성
CREATE TABLE orders_big (
                            order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                            customer_id INT NOT NULL,
                            product_id INT NOT NULL,
                            order_date DATETIME NOT NULL,
                            status VARCHAR(20) NOT NULL,
                            amount INT NOT NULL,
                            city VARCHAR(50) NOT NULL,
                            memo VARCHAR(100) NULL
);
