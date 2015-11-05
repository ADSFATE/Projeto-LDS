<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar Fabricante</title>

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
	$('#btnCadastrar').click(function(event) {
		
		if(!validarForm()){
			return;
		}
		else{
			
		var _material = $('#cmbMaterial').val();
		var _nome= $('#txtNome').val();

		$.post('CadastrarFabricanteController', {
			cmbMaterial : _material,
			txtNome : _nome
		}, function() {
			limpaCampos();
			alert('Cadastro feito com Sucesso!');
		});
	}});
});

</script>

<script type="text/javascript">
	function validarForm() {

		var material = $('#cmbMaterial').val();
		var nome = $('#txtNome').val();

		if (nome == null | nome == "") {

			alert("O NOME é obrigatório");
			return false;

		}
		
		if (material == null | material == "") {

			alert("O MATERIAL é obrigatório");
			return false;

		}

		return true;

	}

	function limpaCampos() {

		$('#cmbMaterial').val("0");
		$('#txtNome').val("");

	}
</script>

</head>
<body>

	<form name="formulario" id="formulario" method="post">

		<%@include file="supMenu.jsp"%>
		
				<div class="container">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">Cadastro de Fabricante</div>
					<div class="panel-body"></div>

		<div class="form-group">

			<label for="txtNome">Nome:</label><span style="color: red">*</span><input
				class="form-control" maxlength="250" type="text" id="txtNome"
				autocomplete="off" name="txtNome" value=""
				placeholder="Nome da Fabricante">

		</div>

		<div class="form-group">

			<label for="tipo">Material:</label><span style="color: red">*</span><select
				class="form-control" id="cmbMaterial" name="cmbMaterial">

				<option value="" selected="selected" />
				<option value='MODEM'>MODEM</option>
				<option value='ROTEADOR'>ROTEADOR</option>
				<option value='GABINETE'>GABINETE</option>
				<option value='CABO'>CABO</option>

			</select>

		</div>
		<br> <br>
		<div align="center">
			<input class="btn btn-success btn-lg" type="button"
				value="Cadastrar Fabricante" name="btnCadastrar" id="btnCadastrar">
		</div>
		<br>
		</div>
		</div>
		</div>

	</form>

</body>
</html>