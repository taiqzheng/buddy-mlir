
add_library(DynamicPad STATIC dynamicPad.o)
set_target_properties(DynamicPad PROPERTIES LINKER_LANGUAGE CXX)

add_executable(dynamic-run
  dynamicPad.cpp
)

target_include_directories(dynamic-run
  PRIVATE
  /root/buddy-mlir/frontend/Interfaces/
)

target_link_directories(dynamic-run
  PRIVATE 
  ${BUDDY_MLIR_LIB_DIR}
  /root/buddy-mlir/build/lib/
)

target_link_libraries(dynamic-run
  PRIVATE
  DynamicPad
  BuddyLibDAP
)
