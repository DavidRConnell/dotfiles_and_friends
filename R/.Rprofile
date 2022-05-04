utils::assignInNamespace(
  "q",
  function(save = "no", status = 0, runLast = TRUE)
  {
    .Internal(quit(save, status, runLast))
  },
  "base"
)

options(browser="qutebrowser")

options(warnPartialMatchDollar = TRUE)
options(warnPartialMatchArgs = TRUE)

Sys.setenv("_R_CHECK_LENGTH_1_CONDITION_" = "true")
