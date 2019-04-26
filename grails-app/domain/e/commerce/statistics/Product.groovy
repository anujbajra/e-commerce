package e.commerce.statistics

class Product {

    String name
    Category category
    long costPrice
    long markedPrice
    int quantity
    String size
    String subCategory

    static hasMany = [sales: Sales]

    static constraints = {
        name blank: false, nullable: false
        category blank: false, nullable: false
        costPrice blank: false, nullable: false
        markedPrice blank: false, nullable: false
        quantity blank: false, nullable: false
        subCategory blank: false, nullable: false
        size blank: false, nullable: false
    }

}
