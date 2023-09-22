CPMAddPackage(NAME units
  GITHUB_REPOSITORY nholthaus/units
  GIT_TAG ${libcarma_nholthaus_units_DEP_VERSION}
  SYSTEM ON
  EXCLUDE_FROM_ALL ON
  OPTIONS
  "BUILD_TESTS OFF"
  "BUILD_DOCS OFF"
)

libcarma_add_to_build(libcarma_metaprogramming)
