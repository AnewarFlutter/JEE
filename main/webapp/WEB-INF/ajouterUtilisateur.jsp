<%@include file="inc/header.jsp" %>

<main class="container">
    

        
    <%-- Show session messages --%>
    <c:if test="${!empty sessionScope.statusMessage}">
        <div class="${sessionScope.status ? 'success' : 'error'}">${sessionScope.statusMessage}</div>
        <c:remove var="statusMessage" scope="session" />
        <c:remove var="status" scope="session" />
    </c:if>
    
    <%-- Show request message for immediate form validation errors --%>
    <c:if test="${!empty requestScope.statusMessage}">
        <div class="${requestScope.status ? 'success' : 'error'}">${requestScope.statusMessage}</div>
    </c:if>

    <h2>Ajout d'un utilisateur</h2>
    <form method="post">
        <label for="nom">Nom</label>
        <input type="text" name="nom" id="nom" value="${utilisateur.nom}">
        <c:if test="${ !empty erreurs.nom }">
            <span class="error">${ erreurs.nom }</span>
        </c:if>
        <label for="prenom">Prenom</label>
        <input type="text" name="prenom" id="prenom" value="${utilisateur.prenom}">
        <c:if test="${ !empty erreurs.prenom }">
            <span class="error">${ erreurs.prenom }</span>
        </c:if>
        <label for="login">Login</label>
        <input type="text" name="login" id="login" value="${utilisateur.login}">
        <c:if test="${ !empty erreurs.login }">
            <span class="error">${ erreurs.login }</span>
        </c:if>
        <label for="password">Password</label>
        <input type="password" name="password" id="password" value="${utilisateur.password}">
        <c:if test="${ !empty erreurs.password }">
            <span class="error">${ erreurs.password }</span>
        </c:if>
        <label for="confirmation">Confirmation</label>
        <input type="password" name="confirmation" id="confirmation">
        <c:if test="${ !empty erreurs.confirmation }">
            <span class="error">${ erreurs.confirmation }</span>
        </c:if>
        <input type="submit" value="Ajouter">
    </form>
</main>
<%@include file="inc/footer.jsp" %>