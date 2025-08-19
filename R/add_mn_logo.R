#' Add MN state logo to ggplot
#'
#' Adds a Minnesota state agency or department logo to the bottom-right of a ggplot object.
#'
#' @param plot A ggplot object. Must be provided.
#' @param type Character. Which logo to use. Options are "primary" (default) or "primary-inverse".
#' @param logo_width Numeric. Width of the logo relative to the plot (default 0.2 = 20\%).
#' @param logo_path Character. Optional full path or URL to a custom logo. If NULL, uses the MN logo based on type.
#'#' @param bg_color Character or NULL. Background color of entire plot. Default is transparent / white.
#'
#' @return A ggplot object with the MN logo image added.
#' @keywords logo
#' @examples
#' \dontrun{
#' p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
#' p |> add_mn_logo(logo_width = 0.20)
#' }
add_mn_logo <- function(plot = NULL,
                        type = "horizontal",
                        logo_width = 0.20,
                        logo_path = NULL,
                        bg_color = NULL) {
  
  if (is.null(plot) || !"ggplot" %in% class(plot)) {return(message("You must provide a ggplot object."))}
  
  if (is.null(logo_path)) {
  
    state_logo_url <- "https://mn.gov/portal/assets/"
    
    type <- gsub(" ", "-", type)
      
    path <- switch(tolower(type),
                   "horizontal"       = paste0(state_logo_url, "horizontal-logo_tcm1077-265300.jpg"),
                   "primary"          = paste0(state_logo_url, "primary-logo_tcm1077-265311.jpg"),
                   "primary-inverse"  = paste0(state_logo_url, "primary-reversed-logo_tcm1077-265309.jpg"),
                   "mdh"              = "https://www.health.state.mn.us/about/images/logo-mdh-mn-h-blu_rgb.png",
                   "mdh-inverse"      = "https://www.health.state.mn.us/about/images/logo-mdh-mn-h-whi_rgb.png",
                   "mdh-tall"         = "https://www.health.state.mn.us/about/images/logo-mdh-mn-v-blu_rgb.png", 
                   "mdh-tall-inverse" = "https://www.health.state.mn.us/about/images/logo-mdh-mn-v-whi_rgb.png", 
                   "mpca"             = "https://stormwater.pca.state.mn.us/images/2/21/MPCA_logo.png",
                   "mpca-inverse"     = "https://www.pca.state.mn.us/themes/custom/mpca/images/mpca-logo-reverse.png",
                   paste0(state_logo_url, "primary-logo_tcm1077-265311.jpg"))
      
    # Cache logo
    cache_dir <- file.path(rappdirs::user_cache_dir("mnthemes"), "logos")
    if (!dir.exists(cache_dir)) dir.create(cache_dir, recursive = TRUE)
    
    local_path <- file.path(cache_dir, basename(path))
    
    if (!file.exists(local_path)) {
      download.file(path, local_path, mode = "wb")
    }
  
    path <- local_path
  } else {
    path <- logo_path
  }
  
  # Add horizontal padding / white space to base plot
  base_plot <- cowplot::ggdraw() +
    cowplot::draw_plot(p, x = 0.004, y = 0.07, width = 0.985, height = 0.92)  # 0.9 widthleaves ~10% margin on right
  
  if (!is.null(bg_color))base_plot <- base_plot + theme(plot.background = element_rect(fill = mn_color(bg_color), color = NA))
  
  base_plot + cowplot::draw_image(path %>% magick::image_read() %>% magick::image_trim(fuzz = 10),
                                  x = 0.964,   # 0.004 left margin, 0.985 width → right edge is 0.004 + 0.985 = 0.989
                                  y = -0.46,
                                  hjust = 1,  # anchor right side of logo
                                  width = logo_width)
}
