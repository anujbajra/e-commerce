<%@ expressionCodec="none" %>
<html>
<head>
    <!--Load the AJAX API-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Sales Report</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link href="https://nightly.datatables.net/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
    <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>

    <asset:javascript src="statistics.js"/>

    <script type="text/javascript">
        var statData1 =${statData};
        var URL = "${createLink(controller:'statistics',action:'getStatisticsReport')}";
        var fromDate="${fromDate}";
        var toDate="${toDate}"

    </script>
</head>

<body>
    <div class="reportContent">
        <div style="display: inline-block">Date From: <input type="text" id="datepickerFrom" autocomplete="off"></div>

        <div style="display: inline-block">Date To: <input type="text" id="datepickerTo" autocomplete="off"></div>
        <input class="runBtn" type="button" value="Run">

        <!--Div that will hold the pie chart-->
        <br>
        <div id="chart_div" ></div>
        <br>
        <table id="stat_table" class="stat_table">
            <thead>
            <tr>
                <th>Category</th>
                <th>Quantity</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="stat" in="${statData}">
                <tr>
                    <td>${stat.key}</td>
                    <td>${stat.value}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</body>
</html>