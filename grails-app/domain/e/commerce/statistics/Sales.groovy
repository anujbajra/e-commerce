package e.commerce.statistics

class Sales {

    Product name
    Category category
    long costPrice
    long sellingPrice
    int quantity
    String subCategory
    Date date
    Branch branch

    static constraints = {
        name blank: false, nullable: false
        category blank: false, nullable: false
        costPrice blank: false, nullable: false
        sellingPrice blank: false, nullable: false
        quantity blank: false, nullable: false
        subCategory blank: false, nullable: false
        date blank: false, nullable: false
        branch blank: false, nullable: false
    }

    static mapping = {
        date defaultValue: "now()"
    }

}
