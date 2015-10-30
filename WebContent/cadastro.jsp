<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Usuário</title>

<link href="/Responsividade/Bootstrap/css/bootstrap-theme.css" rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap-theme.css.map" rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap-theme.min.css" rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap.css" rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap.css.map" rel="Stylesheet" />
<link href="/Responsividade/Bootstrap/css/bootstrap.min.css" rel="Stylesheet" media="screen"/>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

</head>
<body>

<form name="formulario" id="formulario" action="CadastrarUsuarioController" method="POST" role="form">
  
  <div class="container">
  <h2>Cadastro de Usuário</h2>
  <p>Informe seus dados corporativo</p>
  <div class="panel-group">
    <div class="panel panel-primary">
      <div class="panel-heading">Dados</div>
      <div class="panel-body"></div>
           
        <div class='form-group'>
<span>Nome:</span><input type="text" class="form-control" name="txtNome" id="txtNome" autocomplete="off" placeholder="Nome Completo">
</div>
  
        <div class='form-group'>
<span>Matrícula RM:</span><input type="text" class="form-control" maxlength="4" name="txtLogin"
autocomplete="off" id="txtLogin" placeholder="Matricula RM (4 digitos)">
</div>

        <div class='form-group'>
<span>Senha:</span><input type="password" class="form-control" maxlength="6" name="txtSenha" id="txtSenha"
autocomplete="off" placeholder="Sua senha (6 digitos)">
<br>

<div align="center">
<input class="btn btn-success btn-lg" type="submit" value="Cadastrar" name="btnCadastrar">
</div>

</div>

</div>
</div>
</div>
</form>


</body>
</html>