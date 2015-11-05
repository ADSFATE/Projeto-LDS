<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<script type="text/javascript">

function logout(){
	
	$.post('LogoutController',null,function t(){window.location.assign('index.jsp');});
	
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

					<li class="active"><a href="painelsup.jsp">Inicio</a></li>

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
							<li><a href="#">Cadastrar</a></li>
							<li><a href="#">Atribuir</a></li>
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
						aria-expanded="false">Materiais<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="listarmateriais.jsp">Listar</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Técnicos<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="listartecnicos.jsp">Listar</a></li>
						</ul></li>
						
						<li><a href="javascript:logout()">Sair</a></li>

				</ul>

				<div class="pull-right navbar-text">
					<img style="max-height: 30px; width: auto; vertical-align: middle"
						src="<%=request.getContextPath()%>/Images/user.png">
					<%
						out.print("<span style='color:red'>"
								+ request.getSession().getAttribute("nome") + "</span><br>");
					%>
				</div>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
		
</body>
</html>