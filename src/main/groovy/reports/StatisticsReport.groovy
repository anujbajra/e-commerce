/**
 * Created by anuj on 4/16/19.
 */

package reports

import grails.converters.JSON
import org.grails.web.json.JSONObject


class StatisticsReport {


    def getData(){

//        String data="{a:\"1\",b:\"2\"}"
        String data="{\"gents pants\":5,\"ladies t shirt\":20,\"gents shirt\":10,\"gents t shirt\":10,\"ladies pants\":5}"
        JSONObject jsonData= JSON.parse(data)
        return jsonData

    }


}
