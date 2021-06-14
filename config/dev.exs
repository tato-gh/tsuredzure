import Config

config :tsuredzure,
  source_dir: System.get_env("TSUREDZURE_SRC_DIR", "/src/"),
  distribution_dir: System.get_env("TSUREDZURE_DIST_DIR", "/dist/")
