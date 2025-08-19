#' Base ggplot2 theme for internal package use
#'
#' @param base_family Font family
#' @param base_size Base font size
#' @param plot_title_size Size of plot titles
#' @param grid Logical or character controlling grid lines
#' @param axis Logical or character controlling axis lines
#' @param ticks Logical; show axis ticks
#' @keywords internal
base_theme <- function(
    base_family = "TT Arial",
    #'"Helvetica Neue",Helvetica,"Helvetica-Narrow",Arial,sans-serif',
    base_size = 14,
    plot_title_family = base_family,
    plot_title_size = 22,
    plot_title_face = "bold",
    plot_title_margin = 11,
    subtitle_family = base_family,
    subtitle_size = 14,
    subtitle_face = "plain",
    subtitle_margin = 15,
    legend_size = 15,
    strip_text_family = base_family,
    strip_text_size = 14,
    strip_text_face = "plain",
    caption_family = base_family,
    caption_size = 12,
    caption_face = "italic",
    caption_margin = 10,
    caption_align = "left",
    axis_text_size = base_size,
    axis_title_family = subtitle_family,
    axis_title_size = 14,
    axis_title_face = "plain",
    axis_title_just = "rt",
    plot_margin = unit(c(0.2, 0.4, 0.2, 0.2), "cm"), 
    #plot_margin = margin(30, 30, 30, 30),
    #plot_margin = margin(50, 50, 50, 50),
    grid = TRUE,
    grid_col = "#cccccc",
    axis = FALSE,
    axis_col = "#cccccc",
    ticks = FALSE,
    hide_legend = TRUE,
    hide_legend_title = TRUE
) {
  
  # Helper for axis title justification
  xj <- switch(tolower(substr(axis_title_just, 1, 1)), b = 0, l = 0, m = 0.5, c = 0.5, r = 0.995, t = 1)
  yj <- switch(tolower(substr(axis_title_just, 2, 2)), b = 0, l = 0, m = 0.5, c = 0.5, r = 1, t = 1)
  
  # Base theme
  th <- ggplot2::theme_minimal(base_family = base_family, base_size = base_size) +
    theme(
      legend.background = element_blank(),
      #legend.key = element_blank(),
      plot.title = element_text(hjust = 0, size = plot_title_size, margin = margin(b = plot_title_margin),
                                family = plot_title_family, face = plot_title_face),
      plot.subtitle = element_text(hjust = 0, size = subtitle_size, margin = margin(b = subtitle_margin),
                                   family = subtitle_family, face = subtitle_face),
      plot.caption = element_text(hjust = ifelse(caption_align == "right", 1, 0), size = caption_size, margin = margin(t = caption_margin),
                                  family = caption_family, face = caption_face),
      plot.margin = plot_margin,
      axis.text.x = element_text(size = axis_text_size, margin = margin(t = 0)),
      axis.text.y = element_text(size = axis_text_size, margin = margin(r = 0)),
      axis.title.x = element_text(hjust = xj, size = axis_title_size, family = axis_title_family, face = axis_title_face),
      axis.title.y = element_text(hjust = yj, margin = margin(r = 7),
                                  size = axis_title_size, family = axis_title_family, face = axis_title_face),
      axis.title.y.right = element_text(hjust = yj, size = axis_title_size, angle = 90,
                                        family = axis_title_family, face = axis_title_face),
      strip.text = element_text(hjust = 0, size = strip_text_size, face = strip_text_face, family = strip_text_family),
      panel.spacing = unit(2, "lines")
    )
  
  # Turn ON/OFF grid lines
  if (is.logical(grid) && grid) {
    th <- th + theme(panel.grid.major = element_line(color = grid_col, linewidth = 0.2),
                     panel.grid.minor = element_line(color = grid_col, linewidth = 0.15))
  } else if (is.character(grid)) {
    th <- th + theme(panel.grid.major = element_line(color = grid_col, linewidth = 0.2),
                     panel.grid.minor = element_line(color = grid_col, linewidth = 0.15))
    if (!grepl("X", grid, ignore.case = TRUE)) th <- th + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())
    if (!grepl("Y", grid, ignore.case = TRUE)) th <- th + theme(panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank())
  } else {
    th <- th + theme(panel.grid = element_blank())
  }
  
  # Axis lines
  if (is.logical(axis) && axis) {
    th <- th + theme(axis.line = element_line(color = axis_col, linewidth = 0.15))
  } else if (is.character(axis)) {
    axis <- tolower(axis)
    if (grepl("x", axis)) th <- th + theme(axis.line.x = element_line(color = axis_col, linewidth = 0.15))
    if (!grepl("x", axis)) th <- th + theme(axis.line.x = element_blank())
    if (grepl("y", axis)) th <- th + theme(axis.line.y = element_line(color = axis_col, linewidth = 0.15))
    if (!grepl("y", axis)) th <- th + theme(axis.line.y = element_blank())
  } else {
    th <- th + theme(axis.line = element_blank())
  }
  
  # Ticks
  if (!ticks) {
    th <- th + theme(axis.ticks = element_blank())
  } else {
    th <- th + theme(axis.ticks = element_line(linewidth = 0.15),
                     axis.ticks.length = unit(5, "pt"))
  }
  
  # Legend
  th <- th +
    theme(legend.position = ifelse(hide_legend, "none", "right"),
          legend.text = element_text(size = legend_size),
          legend.key.size = unit(1.2, 'cm')
          )
  
  if (hide_legend_title) {
    th <- th + theme(legend.title = element_blank())
  } else {
    th <- th + theme(legend.title = element_text(size = legend_size + 2))
  }
  
  # Return
  th
}
