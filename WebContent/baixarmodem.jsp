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
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
	
	</style>
	

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	
		<script type="text/javascript">
	function validarForm() {

		var cliente = document.forms["formulario"]["txtCliente"].value;
		var circuito = document.forms["formulario"]["txtNcircuito"].value;
		var rat = document.forms["formulario"]["txtNRAT"].value;
		var ratFrente = document.forms["formulario"]["fileRATFrente"].value;
		var ratVerso = document.forms["formulario"]["fileRATVerso"].value;
		
		if (cliente == null || cliente == "") {
			alert("O CLIENTE é obrigatório");
			return false;
		}

		if (circuito == null || circuito == "") {
			alert("O CIRCUITO DE SÉRIE é obrigatório");
			return false;
		}
		
		if (rat == null || rat == "") {
			alert("O NÚMERO DA RAT é obrigatório");
			return false;
		}
		
		if (ratFrente || ratFrente == "") {
			alert("A IMAGEM DA RAT (FRENTE) é obrigatória");
			return false;
		}
		
		if (ratVerso || ratVerso == "") {
			alert("A IMAGEM DA RAT (VERSO) é obrigatória");
			return false;
		}
		
	}
		
</script>

</head>
<body>

	<form name="formulario" id="formulario" onsubmit="return validarForm()" action=""  role="form"
		method="post" enctype="multipart/form-data">
		
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Atribuições<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="atribuirmodem.jsp">Baixar Modem</a></li>
            <li><a href="#">Baixar Roteador</a></li>
            <li><a href="#">Baixar Gabinete</a></li>
            <li><a href="#">Baixar Cabo</a></li>
          </ul>
        </li>
      </ul>
     
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<br>
<br>
					
			<div class="form-group">

			 <label for="txtCliente">Cliente:</label>

		<input class="form-control" type="texti" id="txtCliente" name="txtCliente"
			placeholder="Nome do Cliente">
			
			</div>
			
			<div class="form-group">

			 <label for="txtNcircuito">Nº do Circuito:</label>

		<input class="form-control" type="text" id="txtNcircuito" name="txtNcircuito"
			placeholder="Número do circuito">
			
			</div>
			
			<div class="form-group">

			 <label for="txtNRAT">Nº da RAT:</label>

		<input class="form-control" type="text" name="txtNcircuito"
			placeholder="Número da RAT">
			
			</div>
			
			<div class="form-group">

			 <label for="fileRATFrente">Imagem da RAT (Frente):</label>

					<input class="btn btn-default btn-file" data-buttonText="Find file" name="fileRATFrente" type="file"/>
			
			</div>
			
			<div class="form-group">

			 <label for="fileRATVerso">Imagem da RAT (Verso):</label>

					<input class="btn btn-default btn-file" data-buttonText="Find file" name="fileRATVerso" type="file"/>
			
			</div>
					
		<br>
		<br>
		<div align="center">
		 <input class="btn btn-success" type="submit" value="Baixar Modem" name="btnAtribuirModem">
		  <input type="button" onclick="testeJS()" value="teste"/>
		 <br>
		 <br>
</div>

	</form>

</body>
</html>