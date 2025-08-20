# mnthemes


[![Experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

Minnesota state brand themes and helper functions for ggplot2. Includes
default styles and state agency logos.

------------------------------------------------------------------------

## Installation

You can install the development version from GitHub:

``` r
# install.packages("remotes")
remotes::install_github("tidy-MN/mnthemes")
```

------------------------------------------------------------------------

## Features

- **Themes**: Minnesota branded themes (`theme_mn()`, `theme_mn_dark()`,
  …)  
- **Logos**: Add agency logo to plot (`add_mn_logo()`,
  `add_mn_logo("MPCA")`)

------------------------------------------------------------------------

## Examples

### `theme_mn()`

``` r
p <- ggplot(mtcars, aes(x = mpg, y = wt), ) + 
      labs(title = "Minnesota branded plot",
           subtitle = "Ope! Things are going downhill but it could be worse.",
           caption = "Data from somewhere, 2024-2025",
           x = "MPG",
           y = "Weight") +
      lims(x = c(10, NA), y = c(0, NA)) 

p + 
  geom_point(color = "#003865", size = 7, alpha = 0.5) +
  theme_mn()
```

![](readme_files/figure-commonmark/unnamed-chunk-2-1.png)

### `theme_mn_dark()`

``` r
p + 
  geom_point(color = mn_color("gold"), size = 12, alpha = 0.75) + #"#F0F0F0"
  theme_mn_dark()
```

![](readme_files/figure-commonmark/unnamed-chunk-3-1.png)

### `theme_mn_dark()` - Gold

``` r
p + 
  geom_point(color = "white", size = 12, alpha = 0.75) + #"#F0F0F0"
  theme_mn_dark(text_color = mn_color("gold"))
```

![](readme_files/figure-commonmark/unnamed-chunk-4-1.png)

### `theme_mn_dark()` - Green

``` r
p + 
  geom_point(color = "white", fill = scales::alpha(mn_color("gold"), 0.75),
             size = 15, shape = 21) + 
  geom_smooth(color = mn_color("offwhite")) +
  theme_mn_dark(bg_color = "accent green", text_color = "white")
```

![](readme_files/figure-commonmark/unnamed-chunk-5-1.png)

### `theme_mn_dark()` - Green \| White banner

``` r
p + 
  geom_point(color = "white", fill = scales::alpha(mn_color("gold"), 0.75),
             size = 15, shape = 21) + 
  geom_smooth(color = mn_color("offwhite")) +
  theme_mn_dark(bg_color = "accent green", 
                text_color = "white",
                banner = TRUE,
                banner_color = "offwhite",
                banner_text_color = "accent green")
```

![](readme_files/figure-commonmark/unnamed-chunk-6-1.png)

### `theme_mn_dark()` - Green \| Gold banner

``` r
p + 
  geom_point(color = "white", fill = scales::alpha(mn_color("gold"), 0.75),
             size = 12, shape = 21) + 
  geom_smooth(color = mn_color("offwhite")) +
  theme_mn_dark(bg_color = "accent green", 
                text_color = "white",
                banner = TRUE,
                banner_color = "gold",
                banner_text_color = "accent_green",
                banner_alpha = 0.85) +
  scale_y_continuous(expand = expansion(mult = c(0.001, 0.01)))
```

![](readme_files/figure-commonmark/unnamed-chunk-7-1.png)

### With logo

``` r
p <- p + 
     geom_point(color = "#003865", size = 7, alpha = 0.5) +
     theme_mn() 

p |> add_mn_logo()
```

![](readme_files/figure-commonmark/unnamed-chunk-8-1.png)

``` r
p |> add_mn_logo("mdh", logo_width = 0.18)
```

![](readme_files/figure-commonmark/unnamed-chunk-8-2.png)

``` r
p |> add_mn_logo("mpca", logo_width = 0.28)
```

![](readme_files/figure-commonmark/unnamed-chunk-8-3.png)

``` r
## Dark mode logos
p <- p + 
  geom_point(color = mn_color("white"), size = 7, alpha = 0.7) + 
  theme_mn_dark()

p |> add_mn_logo("mpca-inverse", logo_width = 0.28, bg_color = "blue")
```

![](readme_files/figure-commonmark/unnamed-chunk-8-4.png)

------------------------------------------------------------------------

## MN color names

Use `mn_color("blue")` to get a MN brand color’s HEX code. You can use
the color names in any of the `mntheme` functions and they will convert
the names to the HEX code for you.

Example:

``` r
plot + theme_mn_dark(text_color = "teal")
```

| COLOR_NAME       | HEX_CODE | COLOR                                            |
|------------------|----------|--------------------------------------------------|
| mn blue          | \#003865 | ![mn blue](colors/mn-blue.png)                   |
| blue             | \#003865 | ![blue](colors/blue.png)                         |
| mn green         | \#78BE21 | ![mn green](colors/mn-green.png)                 |
| green            | \#78BE21 | ![green](colors/green.png)                       |
| white            | \#FFFFFF | ![white](colors/white.png)                       |
| offwhite         | \#F0F0F0 | ![offwhite](colors/offwhite.png)                 |
| off white        | \#F0F0F0 | ![off white](colors/off-white.png)               |
| black            | \#000000 | ![black](colors/black.png)                       |
| accent teal      | \#008EAA | ![accent teal](colors/accent-teal.png)           |
| teal             | \#008EAA | ![teal](colors/teal.png)                         |
| accent green     | \#0D5257 | ![accent green](colors/accent-green.png)         |
| accent orange    | \#8D3F2B | ![accent orange](colors/accent-orange.png)       |
| accent purple    | \#5D295F | ![accent purple](colors/accent-purple.png)       |
| accent blue gray | \#A4BCC2 | ![accent blue gray](colors/accent-blue-gray.png) |
| blue gray        | \#A4BCC2 | ![blue gray](colors/blue-gray.png)               |
| accent cream     | \#F5E1A4 | ![accent cream](colors/accent-cream.png)         |
| cream            | \#F5E1A4 | ![cream](colors/cream.png)                       |
| accent sky blue  | \#9BCBEB | ![accent sky blue](colors/accent-sky-blue.png)   |
| sky blue         | \#9BCBEB | ![sky blue](colors/sky-blue.png)                 |
| accent gold      | \#FFC845 | ![accent gold](colors/accent-gold.png)           |
| gold             | \#FFC845 | ![gold](colors/gold.png)                         |
| dark gray        | \#53565A | ![dark gray](colors/dark-gray.png)               |
| gray             | \#53565A | ![gray](colors/gray.png)                         |
| medium gray      | \#97999B | ![medium gray](colors/medium-gray.png)           |
| light gray       | \#D9D9D6 | ![light gray](colors/light-gray.png)             |
| red              | \#A6192E | ![red](colors/red.png)                           |
| orange           | \#E57200 | ![orange](colors/orange.png)                     |

------------------------------------------------------------------------

## Logo options

You can add an organization’s logo to a plot by passing a logo short
name to `add_mn_logo()`.

Example:

``` r
plot %>% add_mn_logo("mdh")
```

| NAME | LOGO |
|----|----|
| horizontal | <img src="https://mn.gov/portal/assets/horizontal-logo_tcm1077-265300.jpg" width="120"> |
| primary | <img src="https://mn.gov/portal/assets/primary-logo_tcm1077-265311.jpg" width="120"> |
| primary-inverse | <span style="background-color:#003865;padding:4px;display:inline-block;"><img src="https://mn.gov/portal/assets/primary-reversed-logo_tcm1077-265309.jpg" width="120"></span> |
| mdh | <img src="https://www.health.state.mn.us/about/images/logo-mdh-mn-h-blu_rgb.png" width="120"> |
| mdh-inverse | <span style="background-color:#003865;padding:4px;display:inline-block;"><img src="https://www.health.state.mn.us/about/images/logo-mdh-mn-h-whi_rgb.png" width="120"></span> |
| mdh-tall | <img src="https://www.health.state.mn.us/about/images/logo-mdh-mn-v-blu_rgb.png" width="60"> |
| mdh-tall-inverse | <span style="background-color:#003865;padding:4px;display:inline-block;"><img src="https://www.health.state.mn.us/about/images/logo-mdh-mn-v-whi_rgb.png" width="60"></span> |
| mpca | <img src="https://stormwater.pca.state.mn.us/images/2/21/MPCA_logo.png" width="120"> |
| mpca-inverse | <span style="background-color:#003865;padding:4px;display:inline-block;"><img src="https://www.pca.state.mn.us/themes/custom/mpca/images/mpca-logo-reverse.png" width="120"></span> |

------------------------------------------------------------------------

## Contributing

Contributions welcome! If you’d like to suggest themes or improvements,
open an issue or pull request on GitHub.

------------------------------------------------------------------------

## License

This package is released under the MIT License.

------------------------------------------------------------------------

## Acknowledgements

Built on the shoulders of [ggplot2](https://ggplot2.tidyverse.org/) and
[hrbrthemes](https://github.com/hrbrmstr/hrbrthemes).

------------------------------------------------------------------------
