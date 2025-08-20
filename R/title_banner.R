#' Add title banner for internal package use
#' @keywords internal
title_banner <- function(bg_color = "#003865", text_color = "#F0F0F0", bg_alpha = 1) {
  
  theme(
    plot.title = ggtext::element_textbox_simple(
      face = "bold",
      size = 22,
      padding = margin(10, 10, 8, 10),
      margin  = margin(t = 0, b = 10, r = 0),
      fill    = scales::alpha(mn_color(bg_color), bg_alpha),
      color   = mn_color(text_color),
      box.color = NA,
    ))
  
  # Option to make banner extend to right edge - future improvement
  # if (FALSE) {
  # theme(
  #   plot.title.position = "plot",                   # put title relative to whole plot
  #   plot.margin = unit(c(0.4, 0, 0.4, 0.4), "cm"),  # remove right margin
  #   axis.title.x = element_text(hjust = 0.985)     # Move axis title away from edge
  # ) +
  # scale_x_continuous(expand = expansion(mult = c(0.1, 0.1)))
  # }
}
