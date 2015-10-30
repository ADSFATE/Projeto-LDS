<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>

<link href="/Projeto LDS/Bootstrap/css/bootstrap-theme.css" rel="Stylesheet" />
<link href="/Projeto LDS/Bootstrap/css/bootstrap-theme.css.map" rel="Stylesheet" />
<link href="/Projeto LDS/Bootstrap/css/bootstrap-theme.min.css" rel="Stylesheet" />
<link href="/Projeto LDS/Bootstrap/css/bootstrap.css" rel="Stylesheet" />
<link href="/Projeto LDS/Bootstrap/css/bootstrap.css.map" rel="Stylesheet" />
<link href="/Projeto LDS/Bootstrap/css/bootstrap.min.css" rel="Stylesheet" media="screen"/>

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<title>Projeto LDS</title>

<script type="text/javascript">
	function validarForm() {

		var login = document.forms['formulario']['txtLogin'].value;
		var senha = document.forms['formulario']['txtSenha'].value;

		if (login == null || login == "") {
			
			$("#lbAviso").text("O LOGIN é obrigatório");
			return false;
			
		}

		if (senha == null || senha == "") {
			
			$("#lbAviso").text("A SENHA é obrigatória!");
			return false;
			
		}

	}
</script>

</head>
<body>

<form name="formulario" id="formulario" onsubmit="return validarForm();" action="AutenticacaoController" method="post">

<div align="center">

<img alt="Locadora Logo" height="150" width="250" src="<%=request.getContextPath()%>/Images/logisticaglobo.jpg">
<br>
<br>
<span>Login:</span><input type="text" name="txtLogin" placeholder="Seu login">
<br>
<br>
<span>Senha:</span><input type="password" maxlength="6" name="txtSenha" placeholder="Sua senha">
<br>
<%if(request.getAttribute("errorMessage") != null){
	out.print("<span id='lbAviso' style='color:red'>" + request.getAttribute("errorMessage") + "</span><br>");
	}else{
		
		out.print("<span id='lbAviso' style='color:red'></span><br>");
		
	} %>

<br>

<input class="btn btn-success" type="submit" value="Entrar" name="btnEntrar">

</div>

</form>

</body>
</html>