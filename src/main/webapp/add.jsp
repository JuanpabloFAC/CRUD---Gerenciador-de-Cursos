<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Gerenciador de Cursos</title>
	<link rel="icon" type="image/png" href="images/icone.png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/style.css">

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
    	<img src="images/gerenciador.png" height="75px">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="add.jsp" style="color: white; font-size: 17px;">Adicionar Curso</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="courses" style="color: white; font-size: 17px;">Ver Cursos</a>
        </li>
      </ul>
     
    </div>
  </div>
</nav>



<h4>Gestor de Cursos</h4>
<form method="post" action="courses">

<input type="hidden" name="courseid" value="<c:out value="${course.courseid}"/>">

<div class="container forn-dlt">
<div class="row g-3 align-items-center">
  <div class="col-auto col-lg-4">
    <label for="inputPassword6" class="col-form-label">Nome do Curso :</label>
  </div>
  <div class="col-auto col-lg-8">
    <input type="text" id="inputPassord6" name="coursename" class="form-control" value="<c:out value="${course.coursename}"/>" aria-describedby="passwordHelpInline" placeholder="Insira o nome do curso">
  </div>
</div>

<div class="row g-3 align-items-center">
  <div class="col-auto col-lg-4">
    <label for="inputPassword6" class="col-form-label">Duração do Curso :</label>
  </div>
  <div class="col-auto col-lg-8">
    <input type="text" id="inputPassword6" name="duration" value="<c:out value="${course.duration}"/>" class="form-control" aria-describedby="passwordHelpInline" placeholder="Em meses">
  </div>
</div>

<div class="row g-3 align-items-center">
  <div class="col-auto col-lg-4">
    <label for="inputPassword6" class="col-form-label">Categoria :</label>
  </div>
  <div class="col-auto col-lg-8">
   <select class="form-select" aria-label="Default select example" name="category">
  <option selected>Selecione a Categoria</option>
  <option value="1" <c:if test="${course.category == 1}"> selected </c:if>>Exatas</option>
  <option value="2" <c:if test="${course.category == 2}"> selected </c:if>>Humanas</option>
  <option value="3" <c:if test="${course.category == 3}"> selected </c:if>>Ciências da Natureza</option>
</select>
  </div>
</div>


<div class="row g-3 align-items-center">
  <div class="col-auto col-lg-4">
    <label for="inputPassword6" class="col-form-label">Preço do Curso :</label>
  </div>
  <div class="col-auto col-lg-8">
    <input type="text" id="inputPassword6" name="fees" class="form-control" value="<c:out value="${course.fees}"/>" aria-describedby="passwordHelpInline" placeholder="Insira o preço do curso">
  </div>
</div>


<div class="row g-3 align-items-centerr">
  <div class="col-auto col-lg-4">
    <label for="inputPassword6" class="col-form-label"></label>
  </div>
  <div class="col-auto col-lg-8">
  
  	<% if(request.getAttribute("course") == null){ %>
  	<input type="submit" value="Adicionar" name="" id="addedit">
  	<%} else { %>
  	 <input type="submit" value="Editar" name=""> 
  	<% } %>
  	
   
  </div>
</div>

</div>
</form>
</body>
</html>