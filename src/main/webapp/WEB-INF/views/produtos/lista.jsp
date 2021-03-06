<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais -
	Casa do Código</title>
	<c:url value="/resources/css" var="cssPath" />
	<link rel="stylesheet" href="${cssPath }/bootstrap.min.css">
</head>
<body>

<nav class="nav">
  <a class="nav-link active" href="${s:mvcUrl('PC#listar').build()}">Lista de Produtos</a>
  <a class="nav-link" href="${s:mvcUrl('PC#form').build()}">Cadastro de Produtos</a>
</nav>

<div class="container">
<br />
<h1>Lista de Produtos</h1><br />

	<div>
		${sucesso}
	</div>
	<div>
		${falha}
	</div>

	<table class="table table-bordered table-striped table-hover">
		<tr>
			<th>Titulo</th>
			<th>Descrição</th>
			<th>Páginas</th>
		</tr>
		<c:forEach items="${produtos}" var="produto">
			<tr>
				<td><a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build() }">${produto.titulo }</a></td>
				<td>${produto.descricao }</td>
				<td>${produto.paginas }</td>
			</tr>
		</c:forEach>
	</table>




</div>


</body>
</html>
