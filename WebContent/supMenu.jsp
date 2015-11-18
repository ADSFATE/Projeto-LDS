<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<style type="text/css">

.navbar-login
{
    width: 305px;
    padding: 10px;
    padding-bottom: 0px;
}

.navbar-login-session
{
    padding: 10px;
    padding-bottom: 0px;
    padding-top: 0px;

}
.navbar-footer 
{
    background-color:#DDD;
}
.navbar-footer-content { padding:15px 15px 15px 15px; }
.dropdown-menu {
padding: 0px;
overflow: hidden;
}

.icon-size
{
    font-size: 87px;
}


</style>

<script type="text/javascript">
	function logout() {

		$.post('LogoutController', null, function t() {
			window.location.assign('index.jsp');
		});

	}
</script>

</head>
<body>

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

				<li class="active"><a href="painelsup.jsp"><strong>Inicio</strong></a></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Modem<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="cadastrarmodem.jsp">Cadastrar</a></li>
						<li><a href="atribuirmodem.jsp">Atribuir</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Roteador<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="cadastrarroteador.jsp">Cadastrar</a></li>
						<li><a href="atribuirroteador.jsp">Atribuir</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Cabo<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="cadastrarcabo.jsp">Cadastrar</a></li>
						<li><a href="atribuircabo.jsp">Atribuir</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Gabinete<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="cadastrargabinete.jsp">Cadastrar</a></li>
						<li><a href="atribuirgabinete.jsp">Atribuir</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Fabricante<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="cadastrarfabricante.jsp">Cadastrar</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Materiais<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="listarmateriais.jsp">Listar</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Técnicos<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="cadastro2.jsp">Cadastrar</a></li>
						<li><a href="listartecnicos.jsp">Listar</a></li>
					</ul></li>

			</ul>


				 <div class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span>
                        <strong><%out.print(request.getSession().getAttribute("nome"));
				%></strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p class="text-center">
                                            <span class="glyphicon glyphicon-user icon-size"></span>
                                        </p>
                                    </div>
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong><%
					out.print(request.getSession().getAttribute("user"));
				%></strong></p>
                                        <p class="text-left small"><%
					out.print(request.getSession().getAttribute("role"));
				%></p>
                                        <p class="text-left">
                                           <button type="button" class="btn btn-primary btn-block btn-sm" data-toggle="modal" data-target="#myModal">Perfil</button>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="divider navbar-login-session-bg"></li>
                        <li class="navbar-login-session-bg">
                            <div class="navbar-login navbar-login-session">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p>
                                            <a href="javascript:logout()" class="btn btn-danger btn-block">Sair</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </div>


		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	
		<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Perfil</h4>
      </div>
      <div class="modal-body">
        <p><strong>Nome: </strong><%out.print(request.getSession().getAttribute("nome_completo"));%></p>
        <p><strong>Tipo: </strong><%out.print(request.getSession().getAttribute("role"));%></p>
        <p><strong>Login: </strong><%out.print(request.getSession().getAttribute("user"));%></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
      </div>
    </div>

  </div>
</div>

</body>
</html>