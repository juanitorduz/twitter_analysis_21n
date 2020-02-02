ggmyplot <- function(...){
  ggplot(...) +
    theme_gray() +
    scale_fill_brewer(palette = "Set1", aesthetics = c("color", "fill"))
}
  
PALETTE_SET1 <- RColorBrewer::brewer.pal(n=9, name = "Set1")