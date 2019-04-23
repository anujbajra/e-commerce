package e.commerce.statistics

import reports.StatisticsReport

class StatisticsController {

    def index() {

        redirect(action:"getStatisticsReport")
    }

    def getStatisticsReport(){

        println "params.dateFrom = ${params.dateFrom}"
        println "params.dateTo = ${params.dateTo}"

        println "inside get statistics report"

        StatisticsReport statisticsReport=new StatisticsReport();

        def statData=statisticsReport.getData(params.dateFrom,params.dateTo);
        println "statData = $statData"
        render (view: "statisticsReport",model: [statData:statData])
    }
}
