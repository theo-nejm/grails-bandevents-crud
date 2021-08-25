<div id="error-messages"></div>

<g:if test="${band.id}">
    <h2>Edit band</h2>
</g:if>
<g:else>
    <h2>Add band</h2>
</g:else>

<g:formRemote
    name="bandForm"
    url="[controller: 'band', action: 'save']"
    update="error-messages"
    onSuccess="flushList()"
>
    <div class="input-group">
        <label for="name">Band name</label>
        <input type="text" id="name" name="name" value="${band.name}" required />
    </div>

    <input type="hidden" value="${band.id}" name="id" />

    <button type="submit">Send</button>
</g:formRemote>