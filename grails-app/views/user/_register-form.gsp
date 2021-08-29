<%@ page import="core.Role" %>
<h2>Register</h2>

<g:formRemote
        name="registerForm"
        url="[controller: 'user', action: 'save']"
        update="error-messages"
        onSuccess="flushList()"
>
    <div class="input-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" value="${user.username}" required />
    </div>

    <div class="input-group">
        <label for="role">Role</label>
        <select id="role" name="roleName">
            <g:each var="role" in="${core.Role.list()}">
                <option value="${role.authority}"
                    <% if(user.id) { %>
                        <% if(core.Role.findById(user.authorities[0].id).authority == role.authority) { %>
                            selected
                        <% } %>
                    <% } %>
                >${role.authority.replace('ROLE_', '')}</option>
            </g:each>
        </select>
    </div>

    <g:if test="${!user.password}">
    <div class="input-group">
        <label for="password">Password</label>

        <input type="password" id="password" name="password" required />

    </div>
    </g:if>

    <button type="submit">Register</button>
</g:formRemote>
<div id="error-messages"></div>