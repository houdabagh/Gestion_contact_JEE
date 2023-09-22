<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Contact</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Style pour le corps de la page */
        body {
            padding: 20px;
        }

        /* Style pour le conteneur du titre */
        .title-container {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Style pour le formulaire */
        .form-container {
            max-width: 400px;
            margin: 0 auto;
        }

        /* Style pour les champs de formulaire */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ddd;
        }

        /* Style pour le bouton "Ajouter" */
        .add-button {
            display: block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .add-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="title-container">
        <h1>Ajouter un Contact</h1>
    </div>
    <div class="form-container">
        <form action="AjouterContactServlet" method="POST">
            <div class="form-group">
                <label for="nom">Nom :</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="form-group">
                <label for="prenom">Prénom :</label>
                <input type="text" id="prenom" name="prenom" required>
            </div>
            <div class="form-group">
                <label for="email">Email :</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="cin">CIN :</label>
                <input type="text" id="cin" name="cin" required>
            </div>
            <div class="form-group">
                <label for="adresse">Adresse :</label>
                <input type="text" id="adresse" name="adresse" required>
            </div>
            <div class="form-group">
                 <input type="hidden" id="tel" name="tel" value="0" required>
            </div>
            <button class="add-button" type="submit"><i class="fas fa-plus-circle"></i> Ajouter</button>
        </form>
    </div>
</body>
</html>