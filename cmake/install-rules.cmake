install(
    TARGETS project1_exe
    RUNTIME COMPONENT project1_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
