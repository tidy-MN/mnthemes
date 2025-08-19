#' Add title banner for internal package use
#' @keywords internal
title_banner <- function(bg_color = "#003865", text_color = "#F0F0F0", bg_alpha = 1) {
 tmp <- (theme(
      plot.title = ggtext::element_textbox_simple(
        face = "bold",
        size = 22,
        padding = margin(10, 10, 8, 10),
        margin = margin(t = 0, b = 10, r = 0),
        fill  = scales::alpha(mn_color_2_hex(bg_color), bg_alpha),     # background color
        color = mn_color_2_hex(text_color),  # text color
        box.color = NA       # no border
        #r = unit(4, "pt")   # rounded corners
      )
    ))
 
 tmp
}
