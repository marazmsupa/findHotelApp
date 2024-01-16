package hotelsite

class OffsetService {

    def convertOffsetToInt(String offset){
        Integer offsetInteger = 0

        if(offset != null && offset != null){
            try {
                offsetInteger = Integer.parseInt(offset)
            }
            catch (NumberFormatException ex){
            }
        }

        return offsetInteger
    }
}
