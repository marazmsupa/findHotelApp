package hotelsite

class Countries {

    String name
    String capital

    static hasMany = [hotels: Hotels]
    static constraints = {
        name maxSize: 255, unique: true, blank: false
        capital maxSize: 128, blank: false
    }

    static mapping = {
        hotels cascade: 'all-delete-orphan'
    }
}
