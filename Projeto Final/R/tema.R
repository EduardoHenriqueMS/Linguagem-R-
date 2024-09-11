tema_status <- function(){
	theme(
		panel.background = element_blank(),
		axis.ticks.y = element_blank(),
		axis.text.y = element_blank(),
		axis.text.x = element_text(size = 12, color = "black"),
		axis.title.y = element_blank(),
		plot.title = element_text(hjust = 0.5)
	)
}

tema <- function(){
	theme(
    panel.background = element_blank(),
    axis.text.y = element_blank(),
    axis.title.y = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title = element_text(hjust = 0.5)
  )
}