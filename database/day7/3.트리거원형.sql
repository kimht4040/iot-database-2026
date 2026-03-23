-- 트리거 원본

delimiter $$
create trigger trg_AfterInsertBook
    after insert on Book for each row
begin
    insert into Book_log (bookid_l, bookname_l, publisher_l, price_l, dml_type)
        -- new.컬럼명 = 새로 들어온 데이터, old.데이터 = 이전값(update, delete)
        values (NEW.bookid, NEW.bookname, new.publisher, new.price, 'insert');
end;
$$

DELIMITER $$

CREATE TRIGGER trg_AfterUpdateBook
    AFTER UPDATE ON Book
    FOR EACH ROW
BEGIN
    INSERT INTO Book_log
    (bookid_l, bookname_l, publisher_l, price_l, dml_type)
    VALUES
        (NEW.bookid, NEW.bookname, NEW.publisher, NEW.price, 'UPDATE');
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_AfterDeleteBook
    AFTER DELETE ON Book
    FOR EACH ROW
BEGIN
    INSERT INTO Book_log
    (bookid_l, bookname_l, publisher_l, price_l, dml_type)
    VALUES
        (OLD.bookid, OLD.bookname, OLD.publisher, OLD.price, 'DELETE');
END
$$
DELIMITER $$;


-- 수정 트리거. 수정은 new , old 모두 사용가능하지만 old 사용 추천

DELIMITER $$

CREATE TRIGGER trg_afterupdatebook
    AFTER UPDATE ON Book
    FOR EACH ROW
BEGIN
    INSERT INTO Book_log
    (bookid_l, bookname_l, publisher_l, price_l, dml_type)
    VALUES
        (OLD.bookid, OLD.bookname, OLD.publisher, OLD.price, 'UPDATE');
END;
$$
DELIMITER $$;