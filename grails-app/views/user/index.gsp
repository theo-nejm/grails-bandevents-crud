<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Users | register & list</title>

    <asset:javascript src="application.js"/>
    <asset:stylesheet src="global.css" />
</head>

<body>
<g:render template="../templates/header" />
<div class="left">
    <h2>Users</h2>
    <div id="listDiv">
        <g:render template="list-users" model="[users: users]" />
    </div>
</div>

<div class="right">
    <div id="formDiv">
        <g:render template="register-form" model="[user: cleanUser, roles: roles]" />
    </div>
</div>

<script>
    function flushList() {
        document.querySelectorAll('input').forEach(input => input.value='');
        <g:remoteFunction controller="user" action="list" update="listDiv" />
    }
</script>
</body>
</html>