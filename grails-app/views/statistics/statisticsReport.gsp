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

    %{--<asset:javascript src="statisticsReport.js"/>--}%

    <script type="text/javascript">
    %{--var statData1 =${statData};--}%
    %{--var URL = "${createLink(controller:'statistics',action:'getStatisticsReport')}";--}%
        $(document).ready(function () {

            $("#datepickerFrom").datepicker({
                changeMonth: true,
                changeYear: true
            }).datepicker("setDate", new Date());
            $("#datepickerTo").datepicker({
                changeMonth: true,
                changeYear: true
            }).datepicker("setDate", new Date());

            $('.runBtn').click(function () {
                var URL = "${createLink(controller:'statistics',action:'getStatisticsReport')}";
                var dateFrom = $("#datepickerFrom").val();
                var dateTo = $("#datepickerTo").val();

                $.ajax({
                    url: URL,
                    data: {dateFrom: dateFrom, dateTo: dateTo},
                    success: function (resp) {
                        document.open();
                        document.write(resp);
                        document.close();
                    }
                });
            });


            $('#stat_table').DataTable();

            // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages': ['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Clothes Type');
                data.addColumn('number', 'Clothes Quantity');

                var statData1 =${statData};
                jQuery.each(statData1, function (i, val) {
                    data.addRow([
                        i,
                        val
                    ]);
                });

                // Set chart options
                var options = {
                    'title': 'How many clothes were sold',
                    'width': 700,
                    'height': 600
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        });

    </script>
</head>

<body>
    <div class="reportContent">
        <div style="display: inline-block">Date From: <input type="text" id="datepickerFrom" autocomplete="off"></div>

        <div style="display: inline-block">Date To: <input type="text" id="datepickerTo" autocomplete="off"></div>
        <input class="runBtn" type="button" value="Run">

        <!--Div that will hold the pie chart-->
        <div id="chart_div"></div>
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