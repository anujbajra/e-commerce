package e.commerce.statistics

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.grails.web.json.JSONObject

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

class StatisticsController {


    def sr
    def statisticsService

    @Secured('ROLE_USER')
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

        def statData=sr.getData(fromDate,toDate);
        statisticsService.serviceMethod()
        println "statData = $statData"

        if (params.dateFrom && params.dateTo) {
            def responseData = [
                    'results': statData
            ]
            render responseData as JSON
        }else {
            render(view: "statisticsReport", model: [statData: statData, fromDate: fromDate, toDate: toDate])
        }
    }
}
