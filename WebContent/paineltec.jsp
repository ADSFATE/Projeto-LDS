<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Painel Técnico</title>

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

<form name="formPainel">

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
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Modem<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="baixarmodem.jsp">Baixar</a></li>
          </ul>
        </li>
        
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Roteador<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Baixar</a></li>
          </ul>
        </li>
        
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cabo<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Baixar</a></li>
          </ul>
        </li>
        
         <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gabinete<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Baixar</a></li>
          </ul>
        </li>
        
      </ul>
     
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<%out.print("<span style='color:red'>" + request.getSession().getAttribute("user") + "</span><br>");%>
<%out.print("<span style='color:red'>" + request.getSession().getAttribute("role") + "</span><br>");%>

</form>

</body>
</html>