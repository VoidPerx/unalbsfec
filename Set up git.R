# Set up .gitignore
writeLines(
  c(
    ".Rproj.user",
    ".Rhistory",
    ".RData",
    ".Ruserdata",
    "*.Rproj",
    "data-raw/*",
    "output/*",
    ".DS_Store"
  ),
  ".gitignore"
)

# Initialize Git
system("git init")
system('git add .')
system('git commit -m "Project initialization"')
