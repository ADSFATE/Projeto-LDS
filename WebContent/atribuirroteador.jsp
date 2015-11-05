<%@page import="br.com.plds.controller.*"%>
<%@page import="br.com.plds.model.vo.Roteador"%>
<%@page import="br.com.plds.model.vo.Tecnico"%>
<%@page import="br.com.plds.model.vo.Fabricante"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--#include file="menusup.html"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Atribuir Roteador</title>

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

<script type="text/javascript">
	$(document).ready(function() {
		$('#btnAtribuirRoteador').click(function(event) {

			if (!validarForm()) {
				return;
			} else {

				var _tipo = $('#cmbTipo').val();
				var _numSerie = $('#txtNserie').val();
				var _fabricante = $('#cmbFabricante').val();
				var _tecnico = $('#cmbTecnico').val();

				$.post('AtribuirRoteadorController', {
					cmbTipo : _tipo,
					txtNserie : _numSerie,
					cmbFabricante : _fabricante,
					cmbTecnico : _tecnico
				}, function() {
					limparCampos();
					alert('Material atribuído com Sucesso!');
				});
			}
		});
	});
</script>

<script type="text/javascript">
	function validarForm() {

		var tipo = document.forms['formulario']['cmbTipo'].value;
		var nserie = document.forms['formulario']['txtNserie'].value;
		var fabricante = document.forms['formulario']['cmbFabricante'].value;
		var tecnico = document.forms['formulario']['cmbTecnico'].value;

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
			alert("O TÉCNICO é obrigatório");
			return false;
		}

		return true;

	}

	function limparCampos() {

		$('#cmbTipo').val("0");
		$('#txtNserie').val("");
		$('#cmbFabricante').val("0");
		$('#cmbTecnico').val("0");

	}
</script>

</head>
<body>

	<form name="formulario" id="formulario" role="form" method="post">

		<%@include file="supMenu.jsp"%>

		<div class="container">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">Atribuição de Roteador</div>
					<div class="panel-body"></div>

					<div class="form-group">

						<label for="tipo">Tipo:</label><span style="color: red">*</span><select
							class="form-control" id="cmbTipo" name="cmbTipo">
							<option value="" selected="selected" />
							<%
								AtribuirRoteadorController amc = new AtribuirRoteadorController();
								ArrayList<Roteador> tipos = amc.getTiposRoteadores();

								for (Roteador m : tipos) {
							%>

							<option value='<%out.print(m.getTipo());%>'>
								<%
									out.print(m.getTipo());
								%>
							</option>

							<%
								}
							%>

						</select>

					</div>

					<div class="form-group">

						<label for="txtNserie">Nº de Série:</label><span
							style="color: red">*</span><input class="form-control"
							type="text" maxlength="20" autocomplete="off" value=""
							id="txtNserie" name="txtNserie" placeholder="Número de série">

					</div>


					<div class="form-group">


						<label for="tipo">Fabricante:</label><span style="color: red">*</span><select
							class="form-control" id="cmbFabricante" name="cmbFabricante">
							<option value="" selected="selected" />
							<%
								ArrayList<Fabricante> fabricantes = amc.getFabricantes();

								for (Fabricante f : fabricantes) {
							%>

							<option value='<%out.print(f.getNome());%>'>
								<%
									out.print(f.getNome());
								%>
							</option>

							<%
								}
							%>

						</select>

					</div>

					<div class="form-group">

						<label for="cmbTecnico">Técnico:</label><span style="color: red">*</span><select
							class="form-control" id="cmbTecnico" name="cmbTecnico">
							<option value="" selected="selected" />
							<%
								ArrayList<Tecnico> tecnicos = amc.getTecnicos();

								for (Tecnico t : tecnicos) {
							%>

							<option
								value='<%out.print(t.getMatricula() + "-" + t.getNome());%>'>
								<%
									out.print(t.getMatricula() + "-" + t.getNome());
								%>
							</option>

							<%
								}
							%>

						</select>

					</div>

					<br> <br>
					<div align="center">
						<input class="btn btn-success btn-lg" type="button"
							value="Atribuir Roteador" name="btnAtribuirRoteador"
							id="btnAtribuirRoteador">
					</div>
					<br>
				</div>
				<
			</div>
		</div>

	</form>

</body>

</html>