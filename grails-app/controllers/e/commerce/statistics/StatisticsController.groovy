package e.commerce.statistics

import com.retailer.reports.StatisticsReport

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter


class StatisticsController {

    def index() {

        redirect(action:"getStatisticsReport")
    }

    def getStatisticsReport(){

        def fromDate
        def toDate
        if (params.dateFrom && params.dateTo) {
            fromDate = params.dateFrom
            toDate = params.dateTo
        }else{
            DateTimeFormatter format=DateTimeFormatter.ofPattern("MM/dd/yyyy");
            fromDate=LocalDateTime.now().minusDays(1).format(format)
            toDate=LocalDateTime.now().format(format)
        }

        StatisticsReport statisticsReport= new StatisticsReport()
        def statData=statisticsReport.getData(fromDate,toDate);
        println "statData = $statData"

        render (view: "statisticsReport",model: [statData:statData,fromDate:fromDate,toDate:toDate])
    }
}
