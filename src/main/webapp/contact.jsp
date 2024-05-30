<%-- 
    Document   : contact
    Created on : 27 mai 2024, 12:07:55
    Author     : aboudou.diakite
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.contact.Contacts" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css?ts=<%= System.currentTimeMillis() %>">
        <title>Liste des contacts</title>
        
    </head>
    <body>
        <div class="container">
        <h1>Liste des contacts</h1>
        <!-- Affichage de la liste des contacts -->
    <table border="1">
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>téléphone</th>
            <th>Compétence Favorite</th>
        </tr>
        <%-- Ajoutez ici du code JSP pour parcourir et afficher la liste des contacts --%>
        <c:forEach var="contact" items="${contacts}">
            <tr>
                <td>${contact.nom}</td>
                <td>${contact.prenom}</td>
                <td>${contact.telephone}</td>
                <td>${contact.competenceFavorite}</td>
                <td>
                    <form action="Ma_Servlet" method="get">
                           <input type="hidden" name="action" value="delete">
                           <input type="hidden" name="nom" value="${contact.nom}">
                           <input type="submit" value="Supprimer" class="sup">
                       </form>
                   </td>
            </tr>
        </c:forEach>
    </table>
    <!-- Formulaire pour ajouter un nouveau contact -->
    <h2>Ajouter un nouveau contact</h2>
    <form action="Ma_Servlet" method="post"> 
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required="ce champ est obligatoire"><br>
        
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom" required="ce champ est obligatoire"><br>
        
        <label for="téléphone">téléphone:</label>
        <input type="text" id="téléphone" name="telephone" required="ce champ est obligatoire"><br>
        
        <label for="competence">Compétence Favorite:</label>
        <input type="text" id="competence" name="competence" required="ce champ est obligatoire"><br>
        
        <input type="submit" value="Ajouter">
    </form>
        </div>
    </body>
</html>
