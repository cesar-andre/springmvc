<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<h1>Cadastro de Produtos</h1><br />
<form:form action="${s:mvcUrl('PC#grava').build() }" method="POST" enctype="multipart/form-data" commandName="produto">
		<div class="form-group">
			<label>Titulo</label>
			<form:input path="titulo" cssClass="form-control"/>
			<form:errors path="titulo" /> 
		</div>
		<div class="form-group">
			<label>Descrição</label>
			<form:textarea path="descricao" cssClass="form-control" />
			<form:errors path="descricao" /> 
		</div>
		<div class="form-group">
			<label>Páginas</label>
			<form:input path="paginas" cssClass="form-control" />
			<form:errors path="paginas" />  
		</div>
		<div class="form-group">
		<label>Data de lançamento</label>
		<form:input path="dataLancamento" cssClass="form-control" />
		<form:errors path="dataLancamento"></form:errors>
		</div>
		<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
			<div class="form-group">
				<label>${tipoPreco}</label> 
				<form:input path="precos[${status.index}].valor" cssClass="form-control" />
				<form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" />
			</div>
		</c:forEach>

		<div class="form-group">
			<label>Sumário</label>
			<input name="sumario" type="file" class="form-control" />
		</div>
		<button type="submit" class="btn btn-primary">Cadastrar</button>
	</form:form>
</div>

</body>
</html>
