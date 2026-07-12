cmake_minimum_required(VERSION 3.25)

project(LJArchiver
    VERSION 0.1.0
    DESCRIPTION "Offline LiveJournal archiver"
    LANGUAGES C
)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

add_executable(LJArchiver
    app/main.c
    app/application.c

    util/util.c
 )

target_include_directories(LJArchiver
    PRIVATE
        include
)

if(MSVC)
    target_compile_options(LJArchiver PRIVATE
        /W4
        /permissive-
    )
endif()