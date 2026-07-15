# -----------------------------------------------------------------------------
# Sanitizers
#
# AddressSanitizer is enabled only for Debug configuration when
# LJ_ENABLE_SANITIZERS is ON.
# -----------------------------------------------------------------------------

if(NOT LJ_ENABLE_SANITIZERS)
    return()
endif()

if(MSVC)

    target_compile_options(lj_project_options INTERFACE
        $<$<CONFIG:Debug>:/fsanitize=address>
    )

    target_link_options(lj_project_options INTERFACE
        $<$<CONFIG:Debug>:/fsanitize=address>
    )

endif()