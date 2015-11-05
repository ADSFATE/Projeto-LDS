<%@page import="br.com.plds.model.vo.*"%>
<%@page import="br.com.plds.controller.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Baixar Gabinete</title>

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

<style type="text/css">
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<script type="text/javascript">
	function validarForm() {

		var nserie = $('#cmbNserie').val();
		var cliente = $('#txtCliente').val();
		var circuito = $('#txtNcircuito').val();
		var rat = $('#txtNRAT').val();
		var ratFrente = $('#fileRATFrente').val();
		var ratVerso = $('#fileRATVerso').val();

		if (nserie == null | nserie == "") {

			alert("O N�MERO DE S�RIE � obrigat�rio");
			return false;

		}

		if (cliente == null | cliente == "") {

			alert("O CLIENTE � obrigat�rio");
			return false;

		}

		if (circuito == null | circuito == "") {

			alert("O CIRCUITO � obrigat�rio");
			return false;

		}

		if (rat == null | rat == "") {

			alert("O N�MERO DA RAT � obrigat�rio");
			return false;

		}

		if (ratFrente == null | ratFrente == "") {

			alert("A IMAGEM DA RAT(FRENTE)" + ratFrente + " � obrigat�ria");
			return false;

		}

		if (ratVerso == null | ratVerso == "") {

			alert("A IMAGEM DA RAT(VERSO) � obrigat�ria");
			return false;

		}

		return true;

	}

	function limpaCampos() {

		$('#cmbNserie').val("0");
		$('#txtCliente').val("");
		$('#txtNcircuito').val("");
		$('#txtNRat').val("");
		$('#fileRATFrente').val("");
		$('#fileRATVerso').val("");

	}
</script>

</head>
<body>

	<form name="formulario" id="formulario"
		onsubmit="return validarForm();" action="BaixarGabineteController"
		enctype="multipart/form-data" method="post">

		<%@include file="tecMenu.jsp"%>

		<br>

		<div class="form-group">

			<label for="tipo">N� de S�rie:</label><span style="color: red">*</span><select
				class="form-control" id="cmbNserie" name="cmbNserie">
				<option value="" selected="selected" />
				<%
					String matTecnico = request.getSession().getAttribute("user")
							.toString();
					BaixarGabineteController amc = new BaixarGabineteController();
					ArrayList<Gabinete> gabinetesDisponiveis = amc
							.getGabinetePorTecnico(matTecnico);

					for (Gabinete m : gabinetesDisponiveis) {
				%>

				<option value='<%out.print(m.getNumeroSerie());%>'>
					<%
						out.print(m.getNumeroSerie());
					%>
				</option>

				<%
					}
				%>

			</select>

		</div>

		<div class="form-group">

			<label for="txtCliente">Cliente:</label><span style="color: red">*</span><input
				class="form-control" maxlength="250" type="text" id="txtCliente"
				autocomplete="off" name="txtCliente" value=""
				placeholder="Nome do Cliente">

		</div>

		<div class="form-group">

			<label for="txtNcircuito">Circuito:</label><span style="color: red">*</span>
			<input class="form-control" maxlength="20" type="text"
				id="txtNcircuito" autocomplete="off" name="txtNcircuito" value=""
				placeholder="N�mero do circuito">

		</div>

		<div class="form-group">

			<label for="txtNRAT">N� da RAT:</label><span style="color: red">*</span><input
				class="form-control" maxlength="20" type="text" name="txtNRAT"
				id="txtNRAT" autocomplete="off" value="" placeholder="N�mero da RAT">

		</div>

		<div class="form-group">

			<label for="fileRATFrente">Imagem da RAT (Frente):</label><span
				style="color: red">*</span><input class="btn btn-default btn-file"
				data-buttonText="Find file" name="fileRATFrente" id="fileRATFrente"
				type="file" accept=".png,.jpg,.jpeg,.bmp,.gif" />

		</div>

		<div class="form-group">

			<label for="fileRATVerso">Imagem da RAT (Verso):</label><span
				style="color: red">*</span><input class="btn btn-default btn-file"
				data-buttonText="Find file" name="fileRATVerso" id="fileRATVerso"
				type="file" accept=".png,.jpg,.jpeg,.bmp,.gif" />

		</div>

		<br> <br>
		<div align="center">
			<input class="btn btn-success btn-lg" type="submit"
				value="Baixar Gabinete" name="btnAtribuirGabinete" id="btnAtribuirGabinete">
			<br> <br>
		</div>

	</form>

</body>
</html>