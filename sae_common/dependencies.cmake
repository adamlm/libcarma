include(FetchContent)

FetchContent_Declare(libcarma_metaprogramming
  SOURCE_DIR ${PROJECT_SOURCE_DIR}/metaprogramming
)

FetchContent_MakeAvailable(libcarma_metaprogramming)
