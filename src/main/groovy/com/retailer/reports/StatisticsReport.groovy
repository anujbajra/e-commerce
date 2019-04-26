/**
 * Created by anuj on 4/16/19.
 */

package com.retailer.reports

import e.commerce.statistics.Sales

import org.grails.web.json.JSONObject
import org.springframework.stereotype.Component

import java.sql.Timestamp
import java.time.LocalDate
import java.time.ZoneId
import java.time.format.DateTimeFormatter

@Component
class StatisticsReport {

    public StatisticsReport(){
        println "object created ...."
    }


    def getData(String dateFrom,String dateTo){

//        select category_id,sum(quantity) from sales where date between '2019-04-25 00:00:00' and '2019-04-25 23:59:00'  group by category_id;

        Timestamp timestamp = new Timestamp(getEpochMilli(dateFrom));
        Timestamp timestamp1 = new Timestamp(getEpochMilli(dateTo));
        def salesCriteria = Sales.createCriteria()
        def resultSet = salesCriteria.list {
            between("date", timestamp, timestamp1)
            projections {
                groupProperty('category')
                sum('quantity')

            }
//            order("quantity", "asc")
        }
        def data=[:]
        resultSet.each {
                data.put(it[0].name,it[1])
        }
        return data as JSONObject

    }

    def getEpochMilli(String date){

        DateTimeFormatter formatter=DateTimeFormatter.ofPattern("MM/dd/yyyy");
        def formattedDate=LocalDate.parse(date,formatter).atStartOfDay(ZoneId.systemDefault()).toEpochSecond() * 1000
        return formattedDate
    }


}
