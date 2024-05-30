<%-- 
    Document   : index
    Created on : 27 mai 2024, 11:05:01
    Author     : aboudou.diakite
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Bienvenue</title>
    </head>
    <body>
        <h1>Bienvenue sur l'application de gestion des contacts!</h1>
            <button class="btn" onclick="redirectToContacts()">Afficher les contacts</button>
            <script>
                function redirectToContacts() {
                    window.location.href = 'contact.jsp';
                }
            </script>
    </body>
</html>
