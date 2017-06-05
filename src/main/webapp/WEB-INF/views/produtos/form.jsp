<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<head>
<title>Livros de Java, Android, iPhone, Ruby, PHP e muito mais -
	Casa do Código</title>
</head>
<body>

	<form:form action="${s:mvcUrl('PC#grava').build() }" method="POST" commandName="produto">
		<div>
			<label>Titulo</label>
			<input type="text" name="titulo" />
			<form:errors path="titulo" /> 
		</div>
		<div>
			<label>Descrição</label>
			<textarea rows="10" cols="20" name="descricao"></textarea>
			<form:errors path="descricao" /> 
		</div>
		<div>
			<label>Páginas</label>
			<input type="text" name="paginas" />
			<form:errors path="paginas" />  
		</div>
		<div>
		<label>Data de lançamento</label>
		<input type="text" name="dataLancamento" />
		<form:errors path="dataLancamento"></form:errors>
		</div>
		<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
			<div>
				<label>${tipoPreco}</label> 
				<input type="text" name="precos[${status.index}].valor" />
				<input type="hidden" name="precos[${status.index}].tipo" value="${tipoPreco}" />
			</div>
		</c:forEach>

		<button type="submit">Cadastrar</button>
	</form:form>

</body>
</html>
