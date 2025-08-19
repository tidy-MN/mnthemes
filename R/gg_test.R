
if (FALSE) {

#source("base_theme.R")
#source("theme_mn.R")

df <- mtcars

"#78BE21"
"#F0F0F0"
"#FFC845"
"#A4BCC2"
"#008EAA"
"#53565A"
"#003865"

p <- ggplot(df) + 
  geom_point(aes(x = mpg, y = wt), color = "#003865", size = 7, alpha = 0.5) +
  labs(title = "MN branded plot",
       subtitle = "The points are going down",
       caption = "Data from somewhere, 2024-2025") +
  theme_mn() 


df <- starwars %>% rename(cracks = mass, distance = height) %>% filter(cracks < 1000)


ggplot(df) + 
  geom_point(aes(x = height, y = mass), color = "white") +
  theme_mn() +
  labs(title = "Dark plot")

ggplot(df) + 
  geom_point(aes(x = height, y = mass)) +
  theme_mn(dark = T) +
  labs(title = "Light plot")



add_mn_logo <- function(p = NA,
                        type = "primary",
                        logo_width = 0.12,
                        logo_height = 0.5) {
  
  logo_url <- "https://mn.gov/portal/assets/"
  
  path <- case_match(type,
                     "primary" ~ "primary-logo_tcm1077-265311.jpg",
                     "primary-inverse" ~ "primary-reversed-logo_tcm1077-265309.jpg",
                     .default = "primary-logo_tcm1077-265311.jpg")
  
  path <- paste0(logo_url, path)
  
  logo <- cowplot::ggdraw() + 
          cowplot::draw_image(path, x = 0, y = 0, 
                              hjust = -0.4, vjust = 0, 
                              width = 1)
  
  # Add horizontal padding / white space
  base_plot <- cowplot::ggdraw() +
    cowplot::draw_plot(p, x = .004, y = 0.13, width = 0.985, height = 0.89)  
  # 0.9 widthleaves ~10% margin on right
  
  logo <- cowplot::ggdraw() + 
    cowplot::draw_image(path,
               x = 0.989,   # 0.004 left margin, 0.985 width → right edge is 0.004 + 0.985 = 0.989
               y = 0.5,
               hjust = 1,  # anchor right side of logo
               vjust = 0.5,
               width = 0.13)
  
  # Stack plot over logo
  stack <- cowplot::plot_grid(
    base_plot,
    NULL,
    logo,
    ncol = 1,
    rel_heights = c(5, 0.22, logo_height) # adjust height ratio
  )
  
  stack
  
  base_plot + cowplot::draw_image(path,
                          x = 0.989,   # 0.004 left margin, 0.985 width → right edge is 0.004 + 0.985 = 0.989
                          y = -0.44,
                          hjust = 1,  # anchor right side of logo
                          width = logo_width)
}

p |> add_mn_logo(logo_width = 0.09)

}
