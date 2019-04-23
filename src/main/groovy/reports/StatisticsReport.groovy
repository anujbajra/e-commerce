/**
 * Created by anuj on 4/16/19.
 */

package reports

import grails.converters.JSON
import org.grails.web.json.JSONObject


class StatisticsReport {


    def getData(dateFrom,dateTo){

        String data
        if(dateFrom && dateTo){
            data = "{\"gents pants\":9,\"ladies t shirt\":30,\"gents shirt\":90,\"gents t shirt\":50,\"ladies pants\":10}"
        }else {
            data = "{\"gents pants\":5,\"ladies t shirt\":20,\"gents shirt\":10,\"gents t shirt\":10,\"ladies pants\":5}"
        }
        JSONObject jsonData= JSON.parse(data)
        return jsonData

    }


}
