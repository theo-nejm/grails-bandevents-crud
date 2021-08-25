<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Bands | register & list</title>
        <asset:javascript src="application.js"/>
        <asset:stylesheet src="global.css" />
    </head>
    <body>
    <g:render template="../templates/header" />
        <div class="left">
            <h2>Bands</h2>
            <div id="listDiv">
                <g:render template="list-bands" model="[bands: bands]" />
            </div>
        </div>
        <div class="right">
            <div id="formDiv">
                <g:render template="register-form" model="[band: cleanBand]" />
            </div>
        </div>
        <script>
            function flushList() {
                <g:remoteFunction controller="band" action="list" update="listDiv" />
            }

            function removeBand(id) {
                <g:remoteFunction controller="band" action="remove" update="listDiv" id="'+id+'" />
            }
        </script>
    </body>
</html>