package e.commerce.statistics

class Branch {

    String name
    String location

    static hasMany = [sales: Sales]

    static constraints = {

        name blank: false, nullable: false
        location blank: false, nullable: false
    }
}
