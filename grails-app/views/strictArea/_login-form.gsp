<h2>Login</h2>

<form
    action="${request.contextPath}/j_spring_security_check"
    method="post"
    id="formLogin"
    name="formLogin"
>
    <div class="input-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="j_username" required />
    </div>

    <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="j_password" />
    </div>

    <button type="submit">Login</button>
</form>
