<%@page import="br.com.plds.controller.*"%>
<%@page import="br.com.plds.model.vo.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Roteador</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<script type="text/javascript">
	$(document).ready(function() {
		$('#btnCadastrar').click(function(event) {

			if (!validarForm()) {
				return;
			} else {

				var _fabricante = $('#cmbFabricante').val();
				var _tipo = $('#txtTipo').val();

				$.post('CadastrarRoteadorController', {
					cmbFabricante : _fabricante,
					txtTipo : _tipo
				}, function() {
					limpaCampos();
					alert('Cadastro feito com Sucesso!');
				});
			}
		});
	});
</script>

<script type="text/javascript">
	function validarForm() {

		var fabricante = $('#cmbFabricante').val();
		var tipo = $('#txtTipo').val();

		if (tipo == null | tipo == "") {

			alert("O TIPO é obrigatório");
			return false;

		}

		if (fabricante == null | fabricante == "") {

			alert("O FABRICANTE é obrigatório");
			return false;

		}

		return true;

	}

	function limpaCampos() {

		$('#cmbFabricante').val("0");
		$('#txtTipo').val("");

	}
</script>

</head>
<body>

	<form name="formulario" id="formulario" method="post">

		<%@include file="supMenu.jsp"%>

		<div class="container">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">Cadastro de Roteador</div>
					<div class="panel-body"></div>

					<div class="form-group">

						<label for="txtTipo">Tipo:</label><span style="color: red">*</span><input
							class="form-control" maxlength="250" type="text" id="txtTipo"
							autocomplete="off" name="txtTipo" value=""
							placeholder="Tipo do Roteador">

					</div>

					<div class="form-group">

						<label for="tipo">Fabricante:</label><span style="color: red">*</span><select
							class="form-control" id="cmbFabricante" name="cmbFabricante">
							<option value="" selected="selected" />
							<%
								CadastrarRoteadorController amc = new CadastrarRoteadorController();
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
					<br> <br>
					<div align="center">
						<input class="btn btn-success btn-lg" type="button"
							value="Cadastrar Roteador" name="btnCadastrar" id="btnCadastrar">
					</div>
					<br>
				</div>
			</div>
		</div>
		<%@include file="footer.jsp"%>

	</form>

</body>
</html>