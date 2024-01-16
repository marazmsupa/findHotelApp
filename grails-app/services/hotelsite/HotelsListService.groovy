package hotelsite

class HotelsListService {

    def offsetService

    def getHotelsListSorted(String name, Countries country){
        def hotelsCriteria = Hotels.createCriteria()

        def hotelsList = hotelsCriteria.list {
            if(name != "" && name != null ){
                like("name", "%${name}%")
            }
            if (country != null){
                eq("country", country)
            }
            order("stars", "desc")
            order("name", "asc")
        }

        return hotelsList
    }

    def getHotelsListSortedWithOffset(String offset, String name, Countries country){
        def hotelsCriteria = Hotels.createCriteria()

        def hotelsList = hotelsCriteria.list(max: 10, offset: offsetService.convertOffsetToInt(offset)) {
            if(name != "" && name != null ){
                like("name", "%${name}%")
            }
            if (country != null){
                eq("country", country)
            }
            order("stars", "desc")
            order("name", "asc")
        }

        return hotelsList
    }



    def getHotelByName(String name){
        Hotels hotel = null

        if (name != null && name != ""){
            def hotelsCriteria = Hotels.createCriteria()
            hotel = hotelsCriteria.get {
                eq('name', name)
            }
        }

        return hotel
    }

    def getHotelsListCount(List<Hotels> hotelsList){
        Integer hotelsListCount

        if(hotelsList == null){
            hotelsListCount = 0
        }
        else{
            hotelsListCount = hotelsList.size()
        }

        return hotelsListCount
    }
}
