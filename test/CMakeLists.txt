# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(project1Tests LANGUAGES CXX)

# ---- Tests ----

add_executable(project1_test source/project1_test.cpp)
target_link_libraries(project1_test PRIVATE project1_lib)
target_compile_features(project1_test PRIVATE cxx_std_17)

add_test(NAME project1_test COMMAND project1_test)

# ---- End-of-file commands ----

add_folders(Test)
