package hotelsite

class Hotels {
    String name
    Countries country
    Integer stars
    String site


    static constraints = {
        name maxSize: 255, unique: true, blank: false
        stars range: 1..5
        site nullable: true
    }
}
