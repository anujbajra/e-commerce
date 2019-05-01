<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="layout" content="statistics_main" />
    <title>Dashboard</title>

    <!-- Datepicker CSS CDN -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Datatable CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>

    <!-- Google charts CDN -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <asset:javascript src="statistics.js"/>

    <script type="text/javascript">
        var statData1 =${statData};
        var URL = "${createLink(controller:'statistics',action:'getStatisticsReport')}";
        var fromDate = "${fromDate}";
        var toDate = "${toDate}";
    </script>

</head>
<body>
    <div style="text-align: center">
        <div class="date-picker date-picker-from" style="margin-right: 15px">
            <label>Date From </label>
            <input type="text" id="datepickerFrom" autocomplete="off">
            <span class="fa fa-calendar"></span>
        </div>


        <div class="date-picker date-picker-to" style="margin-right: 20px">
            <label>Date To </label>
            <input type="text" id="datepickerTo" autocomplete="off">
            <span class="fa fa-calendar"></span>
        </div>
        <input class="run-btn btn btn-info"  type="button" value="Run">
    </div>

    <div id="chart_div" class="chart-div"></div>

    <table id="stat_table" class="table table-striped table-bordered" style="width:100%">
        <thead>
        <tr>
            <th>Category</th>
            <th>Quantity</th>
        </tr>
        </thead>
    </table>
</body>
</html>