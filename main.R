path_parts <- c(
  normalizePath(".tools/bin", winslash = "/", mustWork = FALSE),
  normalizePath(".tools/node/bin", winslash = "/", mustWork = FALSE),
  Sys.getenv("PATH")
)

Sys.setenv(PATH = paste(path_parts, collapse = .Platform$path.sep))

message("Starting Jekyll preview at http://localhost:4000 ...")

system2(
  "bundle",
  c("exec", "jekyll", "serve", "-l", "-H", "localhost"),
  wait = FALSE,
  stdout = "",
  stderr = ""
)
