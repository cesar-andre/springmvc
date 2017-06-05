<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais -
	Casa do Código</title>
</head>
<body>

<h1>Lista de Produtos</h1><br />

	<div>
		${sucesso}
	</div>

	<table>
		<tr>
			<td>Titulo</td>
			<td>Descrição</td>
			<td>Páginas</td>
		</tr>
		<c:forEach items="${produtos}" var="produto">
			<tr>
				<td>${produto.titulo }</td>
				<td>${produto.descricao }</td>
				<td>${produto.paginas }</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>
