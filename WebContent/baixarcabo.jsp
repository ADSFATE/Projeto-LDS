<%@page import="br.com.plds.model.vo.*"%>
<%@page import="br.com.plds.controller.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Baixar Cabo</title>

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

			alert("O NÚMERO DE SÉRIE é obrigatório");
			return false;

		}

		if (cliente == null | cliente == "") {

			alert("O CLIENTE é obrigatório");
			return false;

		}

		if (circuito == null | circuito == "") {

			alert("O CIRCUITO é obrigatório");
			return false;

		}

		if (rat == null | rat == "") {

			alert("O NÙMERO DA RAT é obrigatório");
			return false;

		}

		if (ratFrente == null | ratFrente == "") {

			alert("A IMAGEM DA RAT(FRENTE)" + ratFrente + " é obrigatória");
			return false;

		}

		if (ratVerso == null | ratVerso == "") {

			alert("A IMAGEM DA RAT(VERSO) é obrigatória");
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
		onsubmit="return validarForm();" action="BaixarCaboController"
		enctype="multipart/form-data" method="post">

		<%@include file="tecMenu.jsp"%>

				<div class="container">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">Baixa de Cabo</div>
					<div class="panel-body"></div>

		<div class="form-group">

			<label for="tipo">Nº de Série:</label><span style="color: red">*</span><select
				class="form-control" id="cmbNserie" name="cmbNserie">
				<option value="" selected="selected" />
				<%
				
				if(request.getSession().getAttribute("user") == null){
					response.sendRedirect("index.jsp");
					return;
				}
					String matTecnico = request.getSession().getAttribute("user")
							.toString();
					BaixarCaboController amc = new BaixarCaboController();
					ArrayList<Cabo> cabosDisponiveis = amc
							.getCaboPorTecnico(matTecnico);

					for (Cabo m : cabosDisponiveis) {
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
				placeholder="Número do circuito">

		</div>

		<div class="form-group">

			<label for="txtNRAT">Nº da RAT:</label><span style="color: red">*</span><input
				class="form-control" maxlength="20" type="text" name="txtNRAT"
				id="txtNRAT" autocomplete="off" value="" placeholder="Número da RAT">

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
				value="Baixar Cabo" name="btnAtribuirCabo"
				id="btnAtribuirCabo"> <br> <br>
		</div>
		<br>
		</div>
		</div>
		</div>
		
		<%@include file="footer.jsp"%>

	</form>

</body>
</html>