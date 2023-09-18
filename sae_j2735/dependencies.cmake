include(libcarma_add_to_build)

CPMAddPackage(NAME units
  GITHUB_REPOSITORY nholthaus/units
  GIT_TAG v2.3.3
  SYSTEM ON
  EXCLUDE_FROM_ALL ON
  OPTIONS
  "BUILD_TESTS OFF"
  "BUILD_DOCS OFF"
)

libcarma_add_to_build(libcarma_sae_common)
