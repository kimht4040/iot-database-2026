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
        con = driver->connect("tcp://127.0.0.1:3306", "root", "my123456");

        // 3. 스키마(DB) 선택
        con->setSchema("madangdb");

        cout << "MySQL JDBC 방식 연결 성공!" << endl;

        // 4. 간단한 쿼리 테스트
        sql::Statement *stmt = con->createStatement();
        sql::ResultSet *res = stmt->executeQuery("SELECT 'Hello World' AS _msg");
        while (res->next()) {
            cout << "결과: " << res->getString("_msg") << endl;
        }

        delete res;
        delete stmt;
        delete con;

    } catch (sql::SQLException &e) {
        cerr << "에러 코드: " << e.getErrorCode();
        cerr << ", 에러 내용: " << e.what() << endl;
        return 1;
    }

    return 0;
}