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

	<form:form action="${s:mvcUrl('PC#grava').build() }" method="POST" enctype="multipart/form-data" commandName="produto">
		<div>
			<label>Titulo</label>
			<form:input path="titulo" />
			<form:errors path="titulo" /> 
		</div>
		<div>
			<label>Descrição</label>
			<form:textarea path="descricao" rows="10" cols="20" />
			<form:errors path="descricao" /> 
		</div>
		<div>
			<label>Páginas</label>
			<form:input path="paginas" />
			<form:errors path="paginas" />  
		</div>
		<div>
		<label>Data de lançamento</label>
		<form:input path="dataLancamento" />
		<form:errors path="dataLancamento"></form:errors>
		</div>
		<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
			<div>
				<label>${tipoPreco}</label> 
				<form:input path="precos[${status.index}].valor" />
				<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" />
			</div>
		</c:forEach>

		<div>
			<label>Sumário</label>
			<input name="sumario" type="file" />
		</div>
		<button type="submit">Cadastrar</button>
	</form:form>

</body>
</html>
