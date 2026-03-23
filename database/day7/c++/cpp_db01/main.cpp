#include <iostream>
#include <mysqlx/xdevapi.h> // 확인하신 mysqlx 폴더 안의 헤더 사용

int main() {
    try {
        // X DevAPI는 기본적으로 33060 포트를 사용합니다. (MySQL X Protocol)
        // 만약 에러가 나면 3306으로 바꿔보세요.
        mysqlx::Session sess("localhost", 33060, "root", "my123456");

        std::cout << "🎉 MySQL X DevAPI 연결 성공!" << std::endl;

        // 간단한 쿼리 테스트
        auto res = sess.sql("SELECT 'Hello X DevAPI' AS msg").execute();
        std::cout << "결과: " << res.fetchOne()[0] << std::endl;

    } catch (const mysqlx::Error &err) {
        std::cerr << "❌ 에러 발생: " << err.what() << std::endl;
        return 1;
    }
    return 0;
}