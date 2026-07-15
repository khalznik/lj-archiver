set(TEST_SOURCES
    test_basic.c
)

add_executable(
    lj_test_basic
    ${TEST_SOURCES}
)

target_link_libraries(
    lj_test_basic
    PRIVATE
        lj_project_options
        lj_project_warnings
)

add_test(
    NAME BasicTest
    COMMAND lj_test_basic
)