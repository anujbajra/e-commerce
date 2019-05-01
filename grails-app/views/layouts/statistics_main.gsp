<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'statistics.css')}" type="text/css">
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <g:layoutHead/>

</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <!-- Brand -->
    <a class="navbar-brand" href="#">Dashboard</a>

    <!-- Links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
        </li>
        <!-- Dropdown -->
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
               Domains
            </a>
            <div class="dropdown-menu">
                <g:each var="c" in="${grailsApplication.domainClasses.findAll {
                    !it.clazz.isAnnotationPresent(grails.plugins.GrailsPlugin) }}">
                    <g:link class="dropdown-item" controller="${c.logicalPropertyName}">${c.logicalPropertyName}</g:link>
                </g:each>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/logout">Log out</a>
        </li>

    </ul>
</nav>
<br>
<div class="main">
    <g:layoutBody/>
</div>


</body>
</html>

