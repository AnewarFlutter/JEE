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

    <h2>Mettre a jour un utilisateur</h2>

    <form method="post">
        <input type="hidden" name="id" value="<c:out value='${utilisateur.id}'/>">
        
        <label for="nom">Nom</label>
        <input type="text" id="nom" name="nom" value="<c:out value='${utilisateur.nom}'/>" >
        <c:if test="${!empty erreurs.nom}">
            <span class="error">${erreurs.nom}</span>
        </c:if>
        
        <label for="prenom">Prénom</label>
        <input type="text" id="prenom" name="prenom" value="<c:out value='${utilisateur.prenom}'/>" >
        <c:if test="${!empty erreurs.prenom}">
            <span class="error">${erreurs.prenom}</span>
        </c:if>
        
        <label for="login">Login</label>
        <input type="text" id="login" name="login" value="<c:out value='${utilisateur.login}'/>" >
        <c:if test="${!empty erreurs.login}">
            <span class="error">${erreurs.login}</span>
        </c:if>
        
        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" value="<c:out value='${utilisateur.password}'/>" >
        <c:if test="${!empty erreurs.password}">
            <span class="error">${erreurs.password}</span>
        </c:if>
        
        <label for="confirmation">Confirmation du mot de passe</label>
        <input type="password" id="confirmation" name="confirmation">
        <c:if test="${!empty erreurs.confirmation}">
            <span class="error">${erreurs.confirmation}</span>
        </c:if>
        
        <input type="submit" value="Mettre à jour">
    </form>
</main>
<%@include file="inc/footer.jsp" %>
