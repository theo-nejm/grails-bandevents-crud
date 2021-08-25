<table>
    <thead>
        <tr>
            <th>Event</th>
            <th>Date</th>
            <th>Bands</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <g:each var="event" in="${events}">
            <tr>
                <td>${event.name}</td>
                <td>${event.date.format('dd/MM/yyyy')}</td>
                <td class="bands">
                    <g:each var="band" in="${event.bands}">
                        <p>${band.name}</p>
                    </g:each>
                </td>
                <td class="actions">
                    <g:remoteLink
                            controller="event"
                            action="edit"
                            update="formDiv"
                            id="${event.id}"
                    > Edit </g:remoteLink>

                    <a href="#" onclick="removeEvent(${event.id})">Remove</a>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>