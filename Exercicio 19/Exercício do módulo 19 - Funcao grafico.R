tema_meu <- function(){
	ggplot2::theme(
		panel.background = ggplot2::element_blank(),
		panel.grid.major.y = ggplot2::element_line(color = "gray", linetype = "dashed")
	)
}


grafico_linhas <- function(dados, coordenadax, coordenaday){
	ggplot2::ggplot(dados, ggplot2::aes(x = {{coordenadax}}, y = {{coordenaday}})) +
		ggplot2::geom_line(color = "darkblue", cex = 1)
}