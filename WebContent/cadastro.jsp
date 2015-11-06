<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Usuário</title>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

</head>

<script type="text/javascript">
	function validarForm() {

		var nome = $('#txtNome').val();
		var uf = $('#cmbUF').val();
		var login = $('#txtLogin').val();
		var senha = $('#txtSenha').val();

		if (nome == null | nome == "") {

			alert("O NOME é obrigatório!");
			return false;

		}
		
		if (uf == null | uf == "") {

			alert("A UF é obrigatória!");
			return false;

		}

		if (login == null | login == "") {

			alert("A MATRICULA RM é obrigatória!");
			return false;

		}

		if (senha == null | senha == "") {

			alert("A SENHA é obrigatório");
			return false;

		}

		return true;

	}
</script>

<body>

	<form name="formulario" id="formulario"
		onsubmit="return validarForm();" action="CadastrarUsuarioController"
		method="POST" role="form">

		<div class="container">
			<h2>Cadastro de Usuário</h2>
			<p>Informe suas informações corporativas</p>
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">Dados</div>
					<div class="panel-body"></div>

					<div class='form-group'>
						<span>Nome:</span><input type="text" class="form-control"
							name="txtNome" id="txtNome" autocomplete="off"
							placeholder="Nome Completo" required>
					</div>
					
					<div class='form-group'>
						<span>UF:</span><select
				class="form-control" id="cmbUF" name="cmbUF">
				<option value="" selected></option>
				<option value="CE">CE</option>
				<option value="MA">MA</option>
				<option value="PI">PI</option>
				</select>
				
					</div>

					<div class='form-group'>
						<span>Matrícula RM:</span><input type="text" class="form-control"
							maxlength="4" name="txtLogin" autocomplete="off" id="txtLogin"
							placeholder="Matricula RM (4 digitos)" required>
					</div>

					<div class='form-group'>
						<span>Senha:</span><input type="password" class="form-control"
							maxlength="6" name="txtSenha" id="txtSenha" autocomplete="off"
							placeholder="Sua senha (6 digitos)" required> <br>

						<div align="center">
							<input class="btn btn-success btn-lg" type="submit"
								value="Cadastrar" name="btnCadastrar"> <br> <br>
							<a href="index.jsp" class="text-center new-account">Voltar</a>
						</div>

					</div>

				</div>
			</div>
		</div>

	</form>


</body>
</html>