<%@page import="br.com.plds.controller.*"%>
<%@page import="br.com.plds.model.vo.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Materiais</title>

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
			ListarMateriaisController lmc = new ListarMateriaisController();
		ArrayList<Material> listaMaterial = lmc.getListaMateriais();
		%>

		<table class="table table-hover" id="tablePesquisa">
			<tr>
				<th style="text-align: center">Tipo</th>
				<th style="text-align: center">Fabricante</th>
				<th style="text-align: center">Especie</th>
			</tr>
			<tbody>

				<%
					for(Material m: listaMaterial){
				%>

				<tr class="success">

					<td style="text-align: center">
						<%
							out.print(m.getTipo());
						%>
					</td>
					<td style="text-align: center">
						<%
							out.print(m.getFabricante());
						%>
					</td>
					<td style="text-align: center">
						<%
							out.print(m.getEspecie());
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