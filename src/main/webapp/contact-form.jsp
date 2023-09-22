

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Gestion Contact</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


	
   
</head>
<body>

	

      
      <!-- End Header -->

      <!-- Sidebar -->
     
      <!-- End Sidebar -->
	<br>
	<div class="custom-container">
  <div class="card">
    <div class="card-body">
      <c:if test="${contact != null}">
        <form action="update" method="post">
      </c:if>
      <c:if test="${contact == null}">
        <form action="insert" method="post">
      </c:if>

      <h2 class="text-center">
        <c:if test="${contact != null}">
          Modifier Contact
        </c:if>
        <c:if test="${contact == null}">
        Ajouter  Contact
        </c:if>
      </h2>

      <c:if test="${contact != null}">
        <input type="hidden" name="id" value="<c:out value='${contact.id}' />" />
      </c:if>
<br> <br>
     <div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
         <div class="form-group">
                    <label for="nom">Nom :</label>
                    <input type="text" value="<c:out value='${contact.nom_con}' />" class="form-control form-control-sm" id="nom" name="nom_con" required>
                </div>
                <div class="form-group">
                    <label for="prenom">Prénom :</label>
                    <input type="text" value="<c:out value='${contact.prenom_con}' />" class="form-control form-control-sm" id="prenom" name="prenom_con" required>
                </div>
                <div class="form-group">
                    <label for="email">Email :</label>
                    <input type="email" value="<c:out value='${contact.email}' />" class="form-control form-control-sm" id="email" name="email">
                </div>
                <div class="form-group">
                    <label for="cin">CIN :</label>
                    <input type="text" value="<c:out value='${contact.cin}' />" class="form-control form-control-sm" id="cin" name="cin">
                </div>
                <div class="form-group">
                    <label for="adresse">Adresse :</label>
                    <input type="text" value="<c:out value='${contact.adresse}' />" class="form-control form-control-sm" id="adresse" name="adresse" required>
                </div>
                <div class="form-group">
                     <input type="hidden" value="0" class="form-control form-control-sm" id="tel" name="tel">
                </div>

    

      <div class="text-center">
        <button type="submit" class="btn btn-success">Enregistrer</button>
      </div>
    </form>
  </div>
</div>
	
	 </div>

    
</body>
</html>