<%@page import="br.com.plds.model.vo.Modem"%>
<%@page import="br.com.plds.controller.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Baixar Modem</title>

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
	$(document).ready(function() {
		$('#btnAtribuirModem').click(function(event) {

			if (!validarForm()) {
				return;
			} else {

				var _nserie = $('#cmbNserie').val();
				var _cliente = $('#txtCliente').val();
				var _circuito = $('#txtNcircuito').val();
				var _nrat = $('#txtNRat').val();
				var _ratFrente = $('#fileRATFrente').val();
				var _ratVerso = $('#fileRATVerso').val();

				$.post('BaixarModemController', {
					cmbNserie : _nserie,
					txtCliente : _serie,
					txtNcircuito : _circuito,
					txtNRat : _nrat,
					fileRATFrente : _ratFrente,
					fileRATVerso : _ratVerso
				}, function() {
					limparCampos();
					alert('Operação Realizada com Sucesso!');
				});
			}
		});
	});
</script>

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
		onsubmit="return validarForm();" action="BaixarModemController"
		method="post">

		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Modem<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="baixarmodem.jsp">Baixar</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Roteador<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Baixar</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Cabo<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Baixar</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Gabinete<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Baixar</a></li>
						</ul></li>

				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>

		<br>

		<div class="form-group">

			<label for="tipo">Nº de Série:</label><span style="color: red">*</span><select
				class="form-control" id="cmbNserie" name="cmbNserie">
				<option value="" selected="selected" />
				<%
				
				if(request.getSession().getAttribute("user") == null){
					
					System.out.println("nulo");
					
				}
				else{
					System.out.println("ok");
					
				}
					String matTecnico = request.getSession().getAttribute("user").toString();
					BaixarModemController amc = new BaixarModemController();
					ArrayList<Modem> modensDisponiveis = amc.getModemPorTecnico(matTecnico);

					for (Modem m : modensDisponiveis) {
				%>

				<option value=<%out.print(m.getNumeroSerie());%>>
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
				class="form-control" type="text" id="txtCliente" autocomplete="off"
				name="txtCliente" value="" placeholder="Nome do Cliente">

		</div>

		<div class="form-group">

			<label for="txtNcircuito">Circuito:</label><span style="color: red">*</span>
			<input class="form-control" type="text" id="txtNcircuito"
				autocomplete="off" name="txtNcircuito" value=""
				placeholder="Número do circuito">

		</div>

		<div class="form-group">

			<label for="txtNRAT">Nº da RAT:</label><span style="color: red">*</span><input
				class="form-control" type="text" name="txtNRAT" id="txtNRAT"
				autocomplete="off" value="" placeholder="Número da RAT">

		</div>

		<div class="form-group">

			<label for="fileRATFrente">Imagem da RAT (Frente):</label><span
				style="color: red">*</span><input class="btn btn-default btn-file"
				data-buttonText="Find file" name="fileRATFrente" id="fileRATFrente"
				type="file" />

		</div>

		<div class="form-group">

			<label for="fileRATVerso">Imagem da RAT (Verso):</label><span
				style="color: red">*</span><input class="btn btn-default btn-file"
				data-buttonText="Find file" name="fileRATVerso" id="fileRATVerso"
				type="file" />

		</div>

		<br> <br>
		<div align="center">
			<input class="btn btn-success btn-lg" type="submit"
				value="Baixar Modem" name="btnAtribuirModem"> <br> <br>
		</div>
		
		<%out.print("<span style='color:red'>" + request.getSession().getAttribute("user") + "</span><br>");%>
<%out.print("<span style='color:red'>" + request.getSession().getAttribute("role") + "</span><br>");%>

	</form>

</body>
</html>