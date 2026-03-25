#include <iomanip>
#include <iostream>
#include <mysql_driver.h>
#include <mysql_connection.h>
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>
#include <memory>
#include <string>


using namespace std;
void printMenu() {
    cout << "==================================================" << endl;
    cout << "                     mysql crud 예제              " << endl;
    cout << "==================================================" << endl;
    cout << "1.조회" << endl;
    cout << "2.추가" << endl;
    cout << "3.수정" << endl;
    cout << "4.삭제" << endl;
    cout << "5.종료" << endl;
    cout << "선택 > " << endl;

}

unique_ptr<sql::Connection> connectDB(const string& host, const string& user, const string& pass, const string& dbName) {
    try {
        // 1. 드라이버 객체 생성
        sql::mysql::MySQL_Driver *driver= sql::mysql::get_mysql_driver_instance();

        // 2. 연결 설정 (포트는 일반적인 SQL 포트인 3306 사용)
        sql::Connection *con= driver->connect(host, user, pass);

        // 3. 스키마(DB) 선택
        con->setSchema(dbName);
        cout << "DB 연결 성공! (Schema: " << dbName << ")" << endl;
        return unique_ptr<sql::Connection>(con); // 생성된 연결 객체 반환


    } catch (sql::SQLException &e) {
        cerr << "에러 코드: " << e.getErrorCode();
        cerr << ", 에러 내용: " << e.what() << endl;
        return nullptr;
    }
}

void selectBook(sql::Connection* con) {
    try {
        unique_ptr<sql::Statement> stmt(con->createStatement());
        unique_ptr<sql::ResultSet> res(stmt->executeQuery("SELECT * FROM Book"));

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
    }
    catch (sql::SQLException &e) {
        cerr << "에러 코드: " << e.getErrorCode();
        cerr << ", 에러 내용: " << e.what() << endl;
    }
}

void updateBook(sql::Connection* con) {
    try {
        selectBook(con);
        int id;
        int price;
        string bookName;
        string pub;
        int num;
        cout << "변경할 번호를 고르세요 > ";
        cin >> id;
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
        cout << "수정사항을 입력하시오 >" << endl;
        cout << "bookname >" << endl;
        getline(cin, bookName);
        cout << "publisher >" << endl;
        getline(cin, pub);
        cout << "price >" << endl;
        cin >> price;
        unique_ptr<sql::PreparedStatement> pstmt(con->prepareStatement("update Book set bookname = ?, publisher = ?, price = ? where bookid = ?"));

        pstmt -> setString(1, bookName);
        pstmt -> setString(2, pub);
        pstmt -> setInt(3, price);
        pstmt -> setInt(4, id);
        int rowsAffected = pstmt->executeUpdate();

        if (rowsAffected > 0) {
            cout <<rowsAffected << "업데이트 성공!" << endl;
        } else {
            cout << "도서를 찾을 수 없습니다." << endl;
        }
    }
    catch (sql::SQLException &e) {
        cerr << "에러 코드: " << e.getErrorCode();
        cerr << ", 에러 내용: " << e.what() << endl;
    }

}
void insertBook(sql::Connection* con) {
    int id;
    string bookName;
    string pub;
    int price;
    cout << "bookid >" << endl;
    cin  >> id;
    cin.ignore();
    cout << "bookname >" << endl;
    getline(cin, bookName);
    cout << "publisher >" << endl;
    getline(cin, pub);
    cout << "price >" << endl;
    cin >> price;
    cin.ignore();

    try {
        // 1. PreparedStatement 객체 생성
        unique_ptr<sql::PreparedStatement> pstmt(con->prepareStatement(
    "INSERT INTO Book(bookid, bookname, publisher, price) VALUES (?, ?, ?, ?)"));
        // 2. ? 위치에 변수 매칭
        pstmt -> setInt(1, id);
        pstmt -> setString(2, bookName);
        pstmt -> setString(3, pub);
        pstmt -> setInt(4,price);
        // 3. 실행
        pstmt->executeUpdate();
        cout << "삽입성공" << endl;
    }
    catch (sql::SQLException &e) {
        cerr << "에러 코드: " << e.getErrorCode();
        cerr << ", 에러 내용: " << e.what() << endl;
    }
}
void deleteBook(sql::Connection* con) {
    try {
        selectBook(con);
        int id;
        cout << "지울 bookid를 입력하시오";
        cin  >> id;
        // 1. PreparedStatement 객체 생성
        unique_ptr<sql::PreparedStatement> pstmt(con->prepareStatement(
    "delete from Book where bookid = ?"));
        pstmt -> setInt(1, id);
        int rowsAffected = pstmt->executeUpdate();

        if (rowsAffected > 0) {
            cout <<rowsAffected << "삭제 성공!" << endl;
        } else {
            cout << "도서를 찾을 수 없습니다." << endl;
        }
    }
    catch (sql::SQLException &e) {
        cerr << "에러 코드: " << e.getErrorCode();
        cerr << ", 에러 내용: " << e.what() << endl;
    }
}
//10,Olympic Champions,Pearson,13000

int main() {
    try {
        auto con = connectDB("tcp://127.0.0.1:3306", "madang", "my123456", "madangdb");
        while (1) {
            int menu = 0;
            printMenu();
            cin >> menu;
            switch (menu) {
                case 1:
                    cout << "조회실행" << endl;
                    selectBook(con.get());
                    break;
                case 2:
                    cout << "추가실행" << endl;
                    insertBook(con.get());
                    break;
                case 3:
                    cout << "수정실행" << endl;
                    updateBook(con.get());
                    break;
                case 4:
                    cout << "삭제실행" << endl;
                    deleteBook(con.get());
                    break;
                case 5:
                    cout << "종료" << endl;
                    return 0;
                default:
                    cout << "잘못된 메뉴" << endl;
                    break;
            }
        }



    } catch (sql::SQLException &e) {
        cerr << "런타임 에러: " << e.what() << endl;

        return 1;
    }

    return 0;
}