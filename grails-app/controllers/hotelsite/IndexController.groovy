package hotelsite

class IndexController {
    def index(String hotel_name, String hotel_country, String offset ){
        Integer offsetInteger = 0
        if(offset != null && offset != null){
            try {
                offsetInteger = Integer.parseInt(offset)
            }
            catch (NumberFormatException ex){

            }
        }

        def hotelsCriteria = Hotels.createCriteria()

        Countries givenCountry = null;

        if(hotel_country != "" && hotel_country != null ){
            def countriesCriteria = Countries.createCriteria()
            givenCountry = countriesCriteria.get{
                eq("name", hotel_country)
            }
        }

        def hotelsList = hotelsCriteria.list {
            if(hotel_name != "" && hotel_name != null ){
                like("name", "%${hotel_name}%")
            }
            if (givenCountry != null){
                eq("country", givenCountry)
            }
            order("stars", "desc")
            order("name", "asc")
        };
            def hotelsListCount
            if(hotelsList == null){
                hotelsListCount = 0
            }
            else{
                hotelsListCount = hotelsList.size()
            }

        Integer paginationCount = (hotelsListCount - 1) / 10;

        def hotelsCriteriaNew = Hotels.createCriteria()

        hotelsList = hotelsCriteriaNew.list(max: 10, offset: offsetInteger) {
            if(hotel_name != "" && hotel_name != null ){
                like("name", "%${hotel_name}%")
            }
            if (givenCountry != null){
                eq("country", givenCountry)
            }
            order("stars", "desc")
            order("name", "asc")
        };

        respond([hotelsList: hotelsList, countriesList: Countries.list(), hotelsListCount: hotelsListCount, paginationCount: paginationCount])
    }
}
