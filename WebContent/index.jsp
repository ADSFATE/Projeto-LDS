<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<title>Projeto LDS</title>

<style type="text/css">
.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.account-wall {
	margin-top: 20px;
	padding: 40px 0px 20px 0px;
	background-color: #f7f7f7;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.login-title {
	color: #555;
	font-size: 18px;
	font-weight: 400;
	display: block;
}

.profile-img {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

.need-help {
	margin-top: 10px;
}

.new-account {
	display: block;
	margin-top: 10px;
}
</style>

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

		return true;

	}
</script>

</head>
<body>

	<form name="formulario" id="formulario" action="AutenticacaoController"
		onsubmit="return validarForm()" method="post">

		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-md-offset-4">
					<h1 class="text-center login-title">Logue para acessar o
						sistema</h1>
					<div class="account-wall">
						<div align="center">
							<img alt="Locadora Logo" height="150" width="250"
								src="<%=request.getContextPath()%>/Images/logisticaglobo.jpg">
						</div>
						<br>
						<form class="form-signin">
							<input type="text" name="txtLogin" id="txtLogin" maxlength="4"
								class="form-control" placeholder="Seu login" required autofocus>
							<input type="password" class="form-control" maxlength="6"
								id="txtSenha" name="txtSenha" placeholder="Sua senha" required>

							<%
								if (request.getAttribute("errorMessage") != null) {
									out.print("<span id='lbAviso' style='color:red'>"
											+ request.getAttribute("errorMessage") + "</span><br>");
								} else {

									out.print("<span id='lbAviso' style='color:red'></span><br>");

								}
							%>

							<button class="btn btn-lg btn-primary btn-block" type="submit"
								value="Entrar" id="btnEntrar" name="btnEntrar">Entrar</button>

						</form>
					</div>
					<a href="cadastro.jsp" class="text-center new-account">Cadastre-se</a>
				</div>
			</div>
		</div>

	</form>

</body>
</html>