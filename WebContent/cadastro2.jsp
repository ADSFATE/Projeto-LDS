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

$(document).ready(function() {
	
	$('#btnCadastrar').click(function(event) {
		
		if(!validarForm()){
			return;
		}
		else{
			
		var _nome = $('#txtNome').val();
		var _uf = $('#cmbUF').val();
		var _login = $('#txtLogin').val();
		var _senha = $('#txtSenha').val();

		$.post('CadastrarUsuarioController', {
			txtNome : _nome,
			cmbUF : _uf,
			txtLogin : _login,
			txtSenha : _senha
		}, function() {
			limparCampos();
			alert('Cadastro Realizado!');
		});
	}});
	
});

</script>

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
	
	function limparCampos(){
		
		$('#txtNome').val("");
		$('#cmbUF').val("0");
		$('#txtLogin').val("");
		$('#txtSenha').val("");
		
	}
</script>

<body>

	<form name="formulario" id="formulario"
		method="POST" role="form">

		<%@include file="supMenu.jsp"%>

		<div class="container">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">Cadastro de Técnico</div>
					<div class="panel-body"></div>

					<div class='form-group'>
						<span>Nome:</span><input type="text" class="form-control"
							name="txtNome" id="txtNome" autocomplete="off"
							placeholder="Nome Completo" required>
					</div>

					<div class='form-group'>
						<span>UF:</span><select class="form-control" id="cmbUF"
							name="cmbUF">
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
							<input class="btn btn-success btn-lg" type="button"
								value="Cadastrar" name="btnCadastrar" id="btnCadastrar"> <br> <br>
						</div>

					</div>

				</div>
			</div>
		</div>
		<%@include file="footer.jsp"%>
	</form>


</body>
</html>