######### GRAFICO DE BARRAS - QUALQUER DISCIPLINA #########

grafico_melhores <- function(dados, coordenadax, coordenaday){
	ggplot2::ggplot(dados, ggplot2::aes(x = reorder({{coordenadax}}, {{coordenaday}}), y = {{coordenaday}})) +
	ggplot2::geom_col(fill = "darkblue")+
	ggplot2::geom_label(ggplot2::aes(x = {{coordenadax}}, y = {{coordenaday}}, label = {{coordenaday}}), color = "white", fill = "darkblue") +
	ggplot2::labs(x = "Alunos Destaque", y = "Notas", title="Alunos Destaque do Concurso") +
	ggplot2::coord_flip()
}


grafico_piores <- function(dados, coordenadax, coordenaday){
	ggplot2::ggplot(dados, ggplot2::aes(x = reorder({{coordenadax}}, {{coordenaday}}), y = {{coordenaday}})) +
	ggplot2::geom_col(fill = "darkblue")+
	ggplot2::geom_label(ggplot2::aes(x = {{coordenadax}}, y = {{coordenaday}}, label = {{coordenaday}}), color = "white", fill = "darkblue") +
	ggplot2::labs(x = "Piores Alunos", y = "Notas", title="Alunos com as piores Notas no Concurso") +
	ggplot2::coord_flip()
}




