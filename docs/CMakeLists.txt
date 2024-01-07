add_custom_target(libcarma_docs
  COMMAND mkdocs build
    --config-file ${PROJECT_SOURCE_DIR}/mkdocs.yaml
    --site-dir ${PROJECT_BINARY_DIR}/site
)
