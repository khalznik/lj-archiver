add_library(lj_project_warnings INTERFACE)

if(MSVC)

    target_compile_options(lj_project_warnings INTERFACE
        /W4
        /permissive-
    )

else()

    target_compile_options(lj_project_warnings INTERFACE
        -Wall
        -Wextra
        -Wpedantic
        -Wshadow
        -Wconversion
    )

endif()

if(LJ_WARNINGS_AS_ERRORS)

    if(MSVC)

        target_compile_options(lj_project_warnings INTERFACE
            /WX
        )

    else()

        target_compile_options(lj_project_warnings INTERFACE
            -Werror
        )

    endif()

endif()