<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

   
   
<title>Gestion Contact</title>

	
	<style>
	table tbody tr {
  height: 20px; /* Ajustez la hauteur selon vos besoins */
}
	
	table tbody tr td {
  padding: 2px; /* Ajustez la valeur de la marge intérieure selon vos besoins */
}
	
	table tbody tr td {
  font-size: 14px; /* Ajustez la taille de la police selon vos besoins */
}
	
	
	 .icon-translation {
        transform: translateX(15px);
    }
   .icon-margin {
  margin-left: -15px; /* Ajustez la valeur de la marge négative selon vos besoins */
} 

.sidebar-list-item {
    margin-bottom: -6px; /* Ajustez la valeur selon vos besoins */
}

    </style>
</head>
<body>
 
 

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
		<br>
			<h1 class="text-center">Liste des Contacts</h1>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Ajouter Contact </a>
			</div>
			<br>
			<table id="congeTable" class="table table-bordered">
		
				<thead>
					<tr>
<th>ID</th>						
<th>Nom</th>
<th>Prénom</th>
<th>Email</th>
<th>CIN</th>
<th>Adresse</th>
 <th>Action</th>

						
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="contact" items="${listUser}">

						<tr>
						
<td><c:out value="${contact.id}" /></td>
<td><c:out value="${contact.nom_con}" /></td>
<td><c:out value="${contact.prenom_con}" /></td>
<td><c:out value="${contact.email}" /></td>
<td><c:out value="${contact.cin}" /></td>
<td><c:out value="${contact.adresse}" /></td>
 	<td><a href="edit?id=<c:out value='${contact.id}' />">Modifier</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="delete?id=<c:out value='${contact.id}' />">Supprimer</a></td>
						</tr>
					</c:forEach>
		
				</tbody>

			</table>
			
		</div>
	</div>
	 </div>
	<!-- Scripts -->
    <!-- ApexCharts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    <!-- Custom JS -->
    <script src="js/scripts.js"></script>
  
</body>
</html>