<table>
    <thead>
        <tr>
            <th>Band</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <g:each var="band" in="${bands}">
            <tr>
                <td>${band.name}</td>
                <td class="actions">
                    <g:remoteLink
                            controller="band"
                            action="edit"
                            update="formDiv"
                            id="${band.id}"
                    > Edit </g:remoteLink>

                    <g:remoteLink
                            controller="band"
                            action="remove"
                            update="listDiv"
                            id="${band.id}"
                    > Remove </g:remoteLink>
                </td>
            </tr>

        </g:each>

    </tbody>
</table>