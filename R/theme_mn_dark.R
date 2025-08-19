#' Minnesota dark ggplot2 theme
#'
#' A convenience wrapper around `theme_mn()` that uses a dark Minnesota ggplot2 theme. 
#' By default, it uses a dark blue background with off-white text, and disables the title banner.
#'
#' @param ... Additional arguments passed to `theme_mn()`.
#' @param banner Logical. If TRUE, adds a colored title banner. Default is FALSE.
#' @param bg_color Character. Background color for the dark theme. Default is "blue".
#' @param text_color Character. Text color for the dark theme. Default is "offwhite".
#' @param dark Logical. Must be TRUE for the dark theme. Default is TRUE.
#'
#' @return A `ggplot2` theme object configured for dark mode.
#' 
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
#'   geom_point(size = 3) +
#'   theme_mn_dark()
#'
#' @export
theme_mn_dark <- function(..., 
                          banner = FALSE,
                          bg_color = "blue",
                          text_color = "offwhite",
                          dark = TRUE) {
  theme_mn(..., 
           banner = banner,
           bg_color = bg_color,
           text_color = text_color,
           dark = dark)
}

