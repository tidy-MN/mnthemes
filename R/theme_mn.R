#' Minnesota brand ggplot2 theme
#'
#' Apply custom Minnesota-themed styling to a `ggplot2` plot. 
#' Allows for dark mode, a title banner, and legend and grid customization.
#'
#' @param font_size Numeric. Base font size for plot text. Default is 14.
#' @param title_size Numeric. Font size for plot titles. Default is 22.
#' @param banner Logical. If TRUE, adds a colored title banner. Default is TRUE.
#' @param banner_color Character. Background color of the banner. Default is "blue".
#' @param banner_text_color Character. Text color of the banner. Default is "white".
#' @param banner_alpha Numeric from 0 to 1. Transparency of banner background. Default is 1.
#' @param dark Logical. If TRUE, applies a dark theme with customized background and text colors. Default is TRUE.
#' @param bg_color Character or NULL. Background color of entire plot when dark mode is enabled. Default is NULL (uses theme default).
#' @param text_color Character or NULL. Text color of plot when dark mode is enabled. Default is NULL (uses theme default).
#' @param hide_legend Logical. If TRUE, hides the plot legend. Default is TRUE.
#' @param hide_legend_title Logical. If TRUE, hides the legend title. Default is TRUE.
#' @param legend_size Numeric. Size of legend text. Default is 15.
#' @param hide_x_grid Logical. If TRUE, removes x-axis grid lines. Default is FALSE.
#' @param hide_y_grid Logical. If TRUE, removes y-axis grid lines. Default is FALSE.
#'
#' @return A `ggplot2` theme object added to a plot with ` + `.
#' 
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = wt, y = mpg)) +
#'   geom_point(size = 3) +
#'   theme_mn()
#'
#' @import ggplot2
#' @export
theme_mn <- function(font_size = 14, 
                     title_size = 22,
                     banner = TRUE,
                     banner_color = "blue",
                     banner_text_color = "white",
                     banner_alpha = 1,
                     dark = FALSE,
                     bg_color = NULL,
                     text_color = NULL,
                     hide_legend = TRUE,
                     hide_legend_title = TRUE,
                     legend_size = 15,
                     hide_x_grid = FALSE,
                     hide_y_grid = FALSE
                     ) {

  tmp <- base_theme(legend_size = legend_size,
                    hide_legend = hide_legend,
                    hide_legend_title = hide_legend_title)
  
  if (dark) tmp <- base_theme_dark(mn_color_2_hex(bg_color), mn_color_2_hex(text_color))
  
  if (banner) tmp <- tmp + title_banner(banner_color, banner_text_color, banner_alpha)
  
  if (hide_x_grid) tmp <- tmp + theme(panel.grid.minor.x = element_blank(), panel.grid.major.x = element_blank())
  if (hide_y_grid) tmp <- tmp + theme(panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank())
  
  tmp
}

