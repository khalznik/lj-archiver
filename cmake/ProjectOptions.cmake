option(LJ_ENABLE_TESTS
    "Build unit tests"
    ON
)

option(LJ_ENABLE_SANITIZERS
    "Enable AddressSanitizer and UndefinedBehaviorSanitizer in Debug builds"
    OFF
)

option(LJ_ENABLE_CLANG_TIDY
    "Enable clang-tidy static analysis"
    OFF
)

option(LJ_ENABLE_CPPCHECK
    "Enable cppcheck static analysis"
    OFF
)

option(LJ_WARNINGS_AS_ERRORS
    "Treat compiler warnings as errors"
    OFF
)

add_library(lj_project_options INTERFACE)