#include <iomanip>
#include <iostream>
#include <mysql_driver.h>
#include <mysql_connection.h>
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>

using namespace std;

int main() {
    try {
        sql::mysql::MySQL_Driver *driver;
        sql::Connection *con;
        // 1. 드라이버 객체 생성
        driver = sql::mysql::get_mysql_driver_instance();

        // 2. 연결 설정 (포트는 일반적인 SQL 포트인 3306 사용)
        con = driver->connect("tcp://127.0.0.1:3306", "madang", "my123456");

        // 3. 스키마(DB) 선택
        con->setSchema("madangdb");

        // 4. 간단한 쿼리 테스트
        unique_ptr<sql::Statement> stmt(con->createStatement());
        stmt->execute("SET NAMES utf8mb4");
        unique_ptr<sql::ResultSet> res(stmt->executeQuery("SELECT * FROM Book"));
        std::cout << std::left << std::setw(8) << "ID"
                  << std::setw(40) << "도서명"
                  << std::setw(30) << "출판사"
                  << "가격" << std::endl;
        std::cout << "------------------------------------------------------------" << std::endl;
        while (res->next()) {
            int id = res->getInt("bookid");
            string name = res->getString("bookname");
            string pub = res->getString("publisher");
            std::string priceStr = res->isNull("price") ? "NULL" : std::to_string(res->getInt("price"));




            cout << left << setw(8) << id
                      << setw(40) << name
                      << setw(30) << pub
                      << priceStr  << endl;
        }






        delete con;

    } catch (sql::SQLException &e) {
        cerr << "에러 코드: " << e.getErrorCode();
        cerr << ", 에러 내용: " << e.what() << endl;
        return 1;
    }



    return 0;
}