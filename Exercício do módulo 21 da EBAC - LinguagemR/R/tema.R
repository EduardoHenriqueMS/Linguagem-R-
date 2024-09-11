######### TEMA #########

tema <- function(){
	theme(
		panel.background = element_blank(),
		axis.ticks.x = element_blank(),
		axis.ticks.y = element_blank(),
		axis.text.x = element_blank(),
		axis.text.y = element_text(size = 10, color = "darkblue"),
		axis.title.x = element_text(size = 12, color = "darkred"),
		axis.title.y = element_text(size = 12, color = "darkred"),
		plot.title = element_text(size = 14, color = "darkred"),
		plot.subtitle = element_text(size = 12, color = "darkred")
	)
}
