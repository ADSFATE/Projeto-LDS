<%@page import="br.com.plds.controller.*"%>
<%@page import="br.com.plds.model.vo.Modem"%>
<%@page import="br.com.plds.model.vo.Tecnico"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--#include file="menusup.html"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Atribuir Modem</title>

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

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	
	<script type="text/javascript">
	function validarForm() {

		var tipo = document.forms["formulario"]["cmbTipo"].value;
		var nserie = document.forms["formulario"]["txtNserie"].value;
		var fabricante = document.forms["formulario"]["txtFabricante"].value;
		var tecnico = document.forms["formulario"]["cmbTecnico"].value;
		
		if (tipo == null || tipo == "") {
			alert("O TIPO é obrigatório");
			return false;
		}

		if (nserie == null || nserie == "") {
			alert("O NUMERO DE SÉRIE é obrigatório");
			return false;
		}
		
		if (fabricante == null || fabricante == "") {
			alert("O FABRICANTE é obrigatório");
			return false;
		}
		
		if (tecnico == null || tecnico == "") {
			alert("O TECNICO é obrigatório");
			return false;
		}
		

	}
		
</script>

</head>
<body>

	<form name="formulario" id="formulario" onsubmit="return validarForm()" action="AtribuirModemController"  role="form"
		method="post">

<br>
<br>

		<div class="form-group">

		<label for="tipo">Tipo:</label>

				<select class="form-control" name="cmbTipo">
				<option value="" selected="selected"/>
					<%
						AtribuirModemController amc = new AtribuirModemController();
						ArrayList<Modem> tipos = amc.getTiposModens();

						for (Modem m : tipos) {
					%>

					<option value=<%out.print(m.getTipo());%>>
						<%
							out.print(m.getTipo());
						%>
					</option>

					<%
						}
					%>

				</select>
				
			</div>
		</div>
					
			<div class="form-group">

			 <label for="Nº Série:">Nº de Série:</label>

		<input class="form-control" type="text" name="txtNserie"
			placeholder="Nº série">
			
			</div>
			</div>
			
				<div class="form-group">
			<label for="txtFabricante">Fabricante:</label>

		
				<input type="text" class="form-control" id="txtFabricante" name="txtFabricante"
			placeholder="Fabricante"> 
			</div>
		</div>
		
		<div class="form-group">

		<label for="cmbTecnico">Técnico:</label>
			
				<select class="form-control" id="cmbTecnico" name="cmbTecnico">
				<option value="" selected="selected"/>
					<%
						ArrayList<Tecnico> tecnicos = amc.getTecnicos();

						for (Tecnico t : tecnicos) {
					%>

					<option value=<%out.print(t.getMatricula() + "-" + t.getNome());%>>
						<%
							out.print(t.getMatricula() + "-" + t.getNome());
						%>
					</option>

					<%
						}
					%>

				</select>
				
			</div>
		</div>
		
		
		<br>
		<br>
		<div align="center">
		 <input class="btn btn-success" type="submit" value="Atribuir Modem" name="btnAtribuirModem">
</div>

	</form>

</body>
</html>