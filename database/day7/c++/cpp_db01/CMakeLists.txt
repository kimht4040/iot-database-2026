cmake_minimum_required(VERSION 4.1)
project(cpp_db01)

set(CMAKE_CXX_STANDARD 20)
# 1. 헤더 파일 경로
include_directories("/opt/homebrew/Cellar/mysql-connector-c++/9.6.0/include")

# 2. 라이브러리 경로 (lib64인 경우 lib64로 수정하세요)
link_directories("/opt/homebrew/Cellar/mysql-connector-c++/9.6.0/lib")

add_executable(cpp_db01 main.cpp)

# 3. 라이브러리 파일명 직접 연결
# 'mysqlcppconn'이 아니라 'mysqlcppconnx' (끝에 x 추가)를 시도해보세요!
target_link_libraries(cpp_db01 PRIVATE mysqlcppconnx)