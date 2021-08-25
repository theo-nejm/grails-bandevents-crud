<g:if test="${event.id}">
    <h2>Edit event</h2>
</g:if>
<g:else>
    <h2>Add event</h2>
</g:else>

<g:formRemote
    name="eventForm"
    url="[controller: 'event', action: 'save']"
    update="messages"
    onSuccess="flushList()"
>
    <div class="input-group">
        <label for="name">Event name</label>
        <input type="text" id="name" name="name" value="${event.name}" required />
    </div>

    <div class="input-group">
    <label for="date">Event date</label>
    <input type="date" id="date" name="date" value="${event.date.format('yyyy-MM-dd')}" required />
    </div>

    <div class="input-group">
    <label for="name">Bands</label>
    <select name="bands" multiple>
        <g:each var="band" in="${bands}">
            <option value="${band.id}" <% if(event.hasBand(band)) { %>selected<% }%>  >${band.name}</option>
        </g:each>
    </select>
    </div>

    <input type="hidden" value="${event.id}" name="id" />

    <button type="submit">Send</button>
</g:formRemote>
<div id="messages"></div>
