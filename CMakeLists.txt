cmake_minimum_required(VERSION 3.25)

project(
    LJArchiver
    VERSION 0.1.0
    DESCRIPTION "Offline LiveJournal archiver"
    LANGUAGES C
)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

list(APPEND CMAKE_MODULE_PATH
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
)

include(PreventInSourceBuilds)
include(ProjectOptions)
include(CompilerWarnings)
include(Sanitizers)
include(StaticAnalyzers)

# -----------------------------------------------------------------------------
# Project modules
# -----------------------------------------------------------------------------

set(APP_SOURCES app/main.c app/application.c)

set(ARCHIVE_SOURCES archive/archive.c)

set(CONFIG_SOURCES config/config.c)

set(HTML_SOURCES html/html.c)

set(HTTP_SOURCES http/http.c)

set(LOGGER_SOURCES logger/logger.c)

set(PARSER_SOURCES parser/parser.c)

set(STORAGE_SOURCES storage/storage.c)

set(UTIL_SOURCES util/util.c)

# -----------------------------------------------------------------------------
# Target
# -----------------------------------------------------------------------------

add_executable(LJArchiver)

target_link_libraries(LJArchiver
    PRIVATE
        lj_project_options
        lj_project_warnings
)

target_sources(LJArchiver PRIVATE
    ${APP_SOURCES}
    ${ARCHIVE_SOURCES}
    ${CONFIG_SOURCES}
    ${HTML_SOURCES}
    ${HTTP_SOURCES}
    ${LOGGER_SOURCES}
    ${PARSER_SOURCES}
    ${STORAGE_SOURCES}
    ${UTIL_SOURCES}
)

target_include_directories(LJArchiver
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

if(LJ_ENABLE_TESTS)

    enable_testing()

    add_subdirectory(tests)

endif()