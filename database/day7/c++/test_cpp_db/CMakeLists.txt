cmake_minimum_required(VERSION 3.20)
project(test_cpp_db) # 본인 프로젝트 이름으로 수정

set(CMAKE_CXX_STANDARD 17)

# 1. 확인하신 커넥터의 최상위 경로 설정
set(MYSQL_BASE_DIR "/usr/local/mysql-connector-c++-8.4")

# 2. 헤더 파일 경로 (include와 jdbc 폴더를 모두 포함)
include_directories("${MYSQL_BASE_DIR}/include")
include_directories("${MYSQL_BASE_DIR}/include/jdbc")

# 3. 라이브러리(.dylib) 경로
link_directories("${MYSQL_BASE_DIR}/lib64")

add_executable(${PROJECT_NAME} main.cpp)

# 4. JDBC용 라이브러리 링크 (mysqlcppconn)
target_link_libraries(${PROJECT_NAME} PRIVATE mysqlcppconn)

# 5. macOS 실행 시 라이브러리 위치를 찾을 수 있게 설정 (매우 중요)
set_target_properties(${PROJECT_NAME} PROPERTIES
        INSTALL_RPATH "${MYSQL_BASE_DIR}/lib64"
        BUILD_WITH_INSTALL_RPATH TRUE
)