if(LJ_ENABLE_CLANG_TIDY)

    find_program(
        CLANG_TIDY_EXE
        NAMES clang-tidy
    )

    if(CLANG_TIDY_EXE)

        set(CMAKE_C_CLANG_TIDY
            ${CLANG_TIDY_EXE}
        )

    else()

        message(WARNING
            "clang-tidy was requested but was not found. "
            "Static analysis has been disabled."
)

    endif()

endif()

if(LJ_ENABLE_CPPCHECK)

    find_program(
        CPPCHECK_EXE
        NAMES cppcheck
    )

    if(CPPCHECK_EXE)

        set(CMAKE_C_CPPCHECK
            ${CPPCHECK_EXE}
        )

    else()

        message(WARNING
            "cppcheck was requested but was not found. "
            "Static analysis has been disabled."
)

    endif()

endif()