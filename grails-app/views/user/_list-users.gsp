<%@ page import="core.Role" %>
<table>
    <thead>
    <tr>
        <th>User</th>
        <th>Role</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <g:each var="user" in="${users}">
        <tr>
            <td>${user.username}</td>
            <td><g:each var="authority" in="${user.authorities}">
                <p>${Role.findById(authority.id).authority.replace('ROLE_', '')}</p>
            </g:each></td>
            <td class="actions">
                <g:remoteLink
                        controller="user"
                        action="edit"
                        update="formDiv"
                        id="${user.id}"
                > Edit </g:remoteLink>

                <g:remoteLink
                        controller="user"
                        action="remove"
                        update="listDiv"
                        id="${user.id}"
                > Remove </g:remoteLink>
            </td>
        </tr>

    </g:each>

    </tbody>
</table>