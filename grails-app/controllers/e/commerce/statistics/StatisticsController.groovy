package e.commerce.statistics

import reports.StatisticsReport

class StatisticsController {

    def index() {

        redirect(action:"getStatisticsReport")
    }

    def getStatisticsReport(){

        println "inside get statistics report"

        StatisticsReport statisticsReport=new StatisticsReport();

        def statData=statisticsReport.getData();
        println "statData = $statData"
        render (view: "statisticsReport",model: [statData:statData])
    }
}
