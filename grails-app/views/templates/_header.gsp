<header>
    <h1>band<span>events</span></h1>

    <nav>
        <ul>
            <sec:ifNotLoggedIn>
                <li><a href="login">Login</a></li>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <li><a href="band">Bands</a></li>
                <li><a href="event">Events</a></li>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li><a href="user">Manage users</a></li>
                </sec:ifAllGranted>
                <li><a href="j_spring_security_logout">Logout</a></li>
            </sec:ifLoggedIn>
        </ul>
    </nav>
</header>