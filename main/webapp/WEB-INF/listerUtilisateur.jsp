<%@include file="inc/header.jsp" %>
<main class="container">
    
    <%-- Show session messages --%>
    <c:if test="${!empty sessionScope.statusMessage}">
        <div class="${sessionScope.status ? 'success' : 'error'}">${sessionScope.statusMessage}</div>
        <c:remove var="statusMessage" scope="session" />
        <c:remove var="status" scope="session" />
    </c:if>


    <h2>Liste des utilisateurs</h2>
    <a href="add" class="button">Ajouter un nouvel utilisateur</a>
    <c:choose>
        <c:when test="${empty utilisateurs}">
            <p class="text-center">La liste des utilisateurs est vide !</p>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Login</th>
                        <th>Password</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="utilisateur" items="${utilisateurs}">
                        <tr>
                            <td><c:out value="${utilisateur.id}"/></td>
                            <td><c:out value="${utilisateur.nom}"/></td>
                            <td><c:out value="${utilisateur.prenom}"/></td>
                            <td><c:out value="${utilisateur.login}"/></td>
                            <td><c:out value="${utilisateur.password}"/></td>
                            <td>
                                <a href="update?id=<c:out value='${utilisateur.id}'/>" class="button">Modifier</a>
                            </td>
                            <td>
                                <a href="delete?id=<c:out value='${utilisateur.id}'/>" class="button delete" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur ?');">Supprimer</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</main>
<%@include file="inc/footer.jsp" %>