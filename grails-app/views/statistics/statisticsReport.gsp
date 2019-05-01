<%@ expressionCodec="none" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Collapsible sidebar using Bootstrap 3</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- Bootstrap Js CDN -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'navbarstyle.css')}" type="text/css">

    <!-- Datepicker CSS CDN -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Datatable CDN -->
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>


    <!-- Google charts CDN -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <asset:javascript src="statistics.js"/>

    <script type="text/javascript">
        var statData1 =${statData};
        var URL = "${createLink(controller:'statistics',action:'getStatisticsReport')}";
        var fromDate="${fromDate}";
        var toDate="${toDate}"
    </script>

</head>
<body>



<div class="wrapper">
    <!-- Sidebar Holder -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3 style="text-align: center">Statistics</h3>
        </div>

        <ul class="list-unstyled components">
            <li class="active">
                <a href="#">Report</a>
            </li>
            <li>
                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">Home</a>
                <ul class="collapse list-unstyled" id="homeSubmenu">
                    <li><a href="#">Home 1</a></li>
                    <li><a href="#">Home 2</a></li>
                </ul>
            </li>
            <li>
                <a href="#">About</a>
            </li>
            <li>
                <a href="#">Contact</a>
            </li>
        </ul>

    </nav>

    <!-- Page Content Holder -->
    <div id="content">
        <nav class="navbar navbar-default">
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                        <i class="glyphicon glyphicon-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Page</a></li>
                        <li><a href="#">Page</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div style="display: inline-block">Date From: <input type="text" id="datepickerFrom" autocomplete="off"></div>

        <div style="display: inline-block">Date To: <input type="text" id="datepickerTo" autocomplete="off"></div>
        <input class="runBtn btn btn-info navbar-btn" type="button" value="Run">

        <div id="chart_div" ></div>

        <table id="stat_table"  class="display" style="width:100%">
            <thead>
            <tr>
                <th>Category</th>
                <th>Quantity</th>
            </tr>
            </thead>
            %{--<tbody id="records_table">--}%
            %{--<g:each var="stat" in="${statData}">--}%
                %{--<tr>--}%
                    %{--<td>${stat.key}</td>--}%
                    %{--<td>${stat.value}</td>--}%
                %{--</tr>--}%
            %{--</g:each>--}%
            %{--</tbody>--}%
        </table>



    </div>
</div>

</body>
</html>