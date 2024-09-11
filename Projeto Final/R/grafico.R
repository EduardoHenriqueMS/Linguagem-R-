grafico_status <- function(dados, coordenadax, coordenaday){
	ggplot2::ggplot(dados, ggplot2::aes(x = {{coordenadax}}, y = {{coordenaday}})) +
	ggplot2::geom_col(fill = "darkblue") +
	ggplot2::geom_label(ggplot2::aes(x = {{coordenadax}}, y = {{coordenaday}}, label = {{coordenaday}}), color = "white", fill = "darkblue")
}
