<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Event | register & list</title>
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="global.css" />
</head>
<body>
<g:render template="../templates/header" />
<div class="left">
    <h2>Events</h2>
    <div id="listDiv">
        <g:render template="list-events" model="[events: events]" />
    </div>
</div>

<div class="right">
    <div id="formDiv">
        <g:render template="register-form" model="[event: cleanEvent, bands: bandsList]" />
    </div>
</div>

<script>
    function flushList() {
        <g:remoteFunction controller="event" action="list" update="listDiv" />
    }

    function removeEvent(id) {
        <g:remoteFunction controller="event" action="remove" update="listDiv" id="'+id+'" />
    }
</script>
</body>
</html>