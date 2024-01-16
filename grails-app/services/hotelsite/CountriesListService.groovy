package hotelsite

class CountriesListService {

    def offsetService

    def getCountriesList(String name){
        def countriesCriteria = Countries.createCriteria()

        def countriesList = countriesCriteria.list {
            if(name != null){
                like("name", "%${name}%")
            }
        }

        return countriesList
    }

    def getCountriesListWithOffset(String name, String offset){
        def countriesCriteria = Countries.createCriteria()

        def countriesList = countriesCriteria.list(max: 10, offset: offsetService.convertOffsetToInt(offset)) {
            if(name != null){
                like("name", "%${name}%")
            }
        }

        return countriesList
    }

    def getCountryByName(String name){
        Countries country = null

        if (name != null && name != ""){
            def countriesCriteria = Countries.createCriteria()
            country = countriesCriteria.get {
                eq('name', name)
            }
        }

        return country
    }

    def getCountriesListCount(List<Countries> countriesList){
        Integer countriesListCount

        if(countriesList == null){
            countriesListCount = 0
        }
        else{
            countriesListCount = countriesList.size()
        }

        return countriesListCount
    }
}
