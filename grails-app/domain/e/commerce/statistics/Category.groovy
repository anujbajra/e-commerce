package e.commerce.statistics

class Category {

    String name

    static hasMany = [products: Product,sales: Sales]

    static constraints = {

        name blank: false, nullable: false
    }
}
