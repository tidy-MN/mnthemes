#' Convert MN brand color name to hex code
#' 
#' Returns the HEX code of a mn brand color by name.  
#' 
#' @param color_names Character. Name or vector of names of MN brand colors.
#' @return Character. Hex code of the color (e.g., "#003865").
#' @export
#' @examples
#' mn_color_2_hex("Minnesota Blue")
#' mn_color_2_hex("blue")
#' mn_color_2_hex(c("Accent Teal", "blue", "green"))
mn_color_2_hex <- function(color_names) {
 
  # If input starts with '#', return as-is
  is_hex <- grepl("^#", color_names)
  
  color <- tolower(color_names[!is_hex])
  color <- trimws(color)
  color <- gsub("_", " ", color)
  color <- gsub("-", " ", color)
  color <- gsub("minnesota", "mn", color)
  color <- gsub("extended ", "", color)
  color <- gsub("grey", "gray", color)
  
  mn_colors <- c("mn blue"              = "#003865",
                "blue"                  = "#003865",
                "mn green"              = "#78BE21",
                "green"                 = "#78BE21",
                "white"                 = "#FFFFFF",
                "offwhite"              = "#F0F0F0",
                "off white"             = "#F0F0F0",
                "black"                 = "#000000",
                "accent teal"           = "#008EAA",
                "teal"                  = "#008EAA",
                "accent green"          = "#0D5257",
                "accent orange"         = "#8D3F2B",
                "accent purple"         = "#5D295F",
                "accent blue gray"      = "#A4BCC2",
                "blue gray"             = "#A4BCC2",
                "accent cream"          = "#F5E1A4",
                "cream"                 = "#F5E1A4",
                "accent sky blue"       = "#9BCBEB",
                "sky blue"              = "#9BCBEB",
                "accent gold"           = "#FFC845",
                "gold"                  = "#FFC845",
                "dark gray"             = "#53565A",
                "gray"                  = "#53565A",
                "medium gray"           = "#97999B",
                "light gray"            = "#D9D9D6",
                "red"                   = "#A6192E",
                "orange"                = "#E57200")
  
  
  hex <- mn_colors[color]
  
  if (any(is.na(hex))) warning("Unknown color(s): ", paste(color[is.na(hex)], collapse = ", "))
  
  # Combine HEX inputs with looked-up colors
  result <- color_names
  result[!is_hex] <- hex
  
  unname(result)
}


#' @export
mn_color <- mn_color_2_hex
