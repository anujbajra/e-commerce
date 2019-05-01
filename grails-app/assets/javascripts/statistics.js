$(document).ready(function () {

    $("#dashBoard_menu").addClass("active");

    initDatePicker(fromDate,toDate);

    $('#stat_table').DataTable({
        data: statData1,
        columns: [
            { data: 'Category' },
            { data: 'Quantity' }
        ]
    });

    $('.run-btn').click(function () {
        var URL = URL;
        var dateFrom = $("#datepickerFrom").val();
        var dateTo = $("#datepickerTo").val();

        $.ajax({
            url: URL,
            data: {dateFrom: dateFrom, dateTo: dateTo},
            success: function (resp) {

                drawChart(resp.results);

                var datatable = $('#stat_table').DataTable();
                datatable.clear();
                datatable.rows.add(resp.results);
                datatable.draw();
            }
        });
    });

    // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages': ['corechart']});

    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(function () {
        drawChart(statData1);
    });

});

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart(statData1) {

    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Clothes Type');
    data.addColumn('number', 'Clothes Quantity');

    jQuery.each(statData1, function (i, val) {
        data.addRow([
            val.Category,
            val.Quantity
        ]);
    });

    // Set chart options
    var options = {
        'title': '',
        'width': 500,
        'height': 400
    };

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
}

function initDatePicker(fromDate,toDate) {
    $("#datepickerFrom").datepicker({
        changeMonth: true,
        changeYear: true
    }).datepicker("setDate", fromDate);
    $("#datepickerTo").datepicker({
        changeMonth: true,
        changeYear: true
    }).datepicker("setDate", toDate);
    $('.date-picker-from .fa-calendar').click(function() {
        $("#datepickerFrom").focus();
    });
    $('.date-picker-to .fa-calendar').click(function() {
        $("#datepickerTo").focus();
    });


}
