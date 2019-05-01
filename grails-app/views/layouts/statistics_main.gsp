<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'navdropdown.css')}" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <g:layoutHead/>

</head>
<body>

<div class="navbar" id="navbar">
    <a id="dashBoard_menu" href="#home">Dashboard</a>
    <div class="dropdown">
        <button class="dropbtn">Domains
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <g:each var="c" in="${grailsApplication.domainClasses.findAll {
                !it.clazz.isAnnotationPresent(grails.plugins.GrailsPlugin)
            }}">
                    <g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName}</g:link>
            </g:each>
        </div>
    </div>
    <a href="#contact">Contact</a>
    <a href="/logout">Log Out</a>
</div>
<br></br>
<div class="main">
    <g:layoutBody/>
</div>


</body>
</html>

