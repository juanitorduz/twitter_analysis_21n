ggmyplot <- function(...){
  ggplot(...) +
    theme_gray() +
    scale_color_brewer(palette = "Set1") +
    scale_fill_brewer(palette = "Set1")
}
  
PALETTE_SET1 <- RColorBrewer::brewer.pal(n=9, name = "Set1")