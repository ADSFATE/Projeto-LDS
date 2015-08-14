<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="CadastroController" method="POST">

<span>Nome:</span><input type="text" name="txtNome" placeholder="Seu login">
<br>
<br>
<span>Login:</span><input type="text" name="txtLogin" placeholder="Seu login">
<br>
<br>
<span>Senha:</span><input type="password" name="txtSenha" placeholder="Sua senha">
<br>
<br>
<input class="btn btn-success" type="submit" value="Cadastrar" name="btnCadastrar">

</form>


</body>
</html>