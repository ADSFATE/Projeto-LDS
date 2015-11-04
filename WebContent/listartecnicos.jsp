<%@page import="br.com.plds.controller.*"%>
<%@page import="br.com.plds.model.vo.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de T�cnicos</title>

<link href="/Responsividade/Bootstrap/css/bootstrap-theme.css"
	rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap-theme.css.map"
	rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap-theme.min.css"
	rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap.css"
	rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap.css.map"
	rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap.min.css"
	rel="Stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

</head>
<body>

	<form name="formulario" id="formulario" method="post">

		<%@include file="supMenu.jsp"%>
		<br>
		<%
			ListarTecnicosController lmc = new ListarTecnicosController();
		ArrayList<Tecnico> listaTecnicos = lmc.getListaTecnicos();
		%>

		<table class="table table-hover" id="tablePesquisa">
			<tr>
				<th style="text-align: center">Nome</th>
				<th style="text-align: center">Matricula</th>
				<th style="text-align: center">UF</th>
			</tr>
			<tbody>

				<%
					for(Tecnico m: listaTecnicos){
				%>

				<tr class="success">

					<td style="text-align: center">
						<%
							out.print(m.getNome());
						%>
					</td>
					<td style="text-align: center">
						<%
							out.print(m.getMatricula());
						%>
					</td>
					<td style="text-align: center">
						<%
							out.print(m.getUf());
						%>
					</td>
					
				</tr>

				<%
					}
				%>

			</tbody>
		</table>


	</form>

</body>
</html>