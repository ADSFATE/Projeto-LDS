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
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<title>Projeto LDS</title>

</head>
<body>

<form class="well well-lg" action="AutenticacaoController" method="post">

<div align="center">

<img alt="Locadora Logo" height="150" width="250" src="<%=request.getContextPath()%>/Images/logisticaglobo.jpg">
<br>
<br>
<span>Login:</span><input type="text" name="txtLogin" placeholder="Seu login">
<br>
<br>
<span>Senha:</span><input type="password" name="txtSenha" placeholder="Sua senha">
<br>
<br>
<input class="btn btn-success" type="submit" value="Cadastrar" name="btnCadastrar">

</div>

</form>

</body>
</html>