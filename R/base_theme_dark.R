#' Fill plot background and change all text colors
#' 
#' @keywords internal
base_theme_dark <- function (bg_color = "#003865",
                             text_color = "#F0F0F0") 
{
  base_theme() + 
    theme(
      plot.background  = element_rect(fill = bg_color, color = NA),
      panel.background = element_rect(fill = bg_color, color = NA),
      
      # Set text colors
      axis.text.x   = element_text(color = text_color),
      axis.text.y   = element_text(color = text_color),
      axis.title.x  = element_text(color = text_color),
      axis.title.y  = element_text(color = text_color),
      axis.title.y.right = element_text(color = text_color),
      strip.text    = element_text(color = text_color),
      plot.title    = element_text(color = text_color),
      plot.subtitle = element_text(color = text_color),
      plot.caption  = element_text(color = text_color),
      legend.text   = element_text(color = text_color),
      legend.title  = element_text(color = text_color)
    )
}
